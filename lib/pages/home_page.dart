/**
 * 《Flutter从入门到进阶-实战携程网App》
 * 课程地址：
 * https://coding.imooc.com/class/321.html
 * 课程代码、文档：
 * https://git.imooc.com/coding-321/
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_mav_model.dart';

import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/speak_page.dart';
import 'package:flutter_trip/widget/grid_nav.dart';
import 'package:flutter_trip/widget/loading_container.dart';
import 'package:flutter_trip/widget/local_nav.dart';
import 'package:flutter_trip/widget/sales_box.dart';
import 'package:flutter_trip/widget/search_bar.dart';
import 'package:flutter_trip/widget/sub_nav.dart';
import 'package:flutter_trip/widget/webview.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List _imageUrls = [
//    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
//    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
//    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
//  ];
  double appBarAlpha = 0;
  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavList = [];
  SalesBoxModel salesBox;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3600),(){
      FlutterSplashScreen.hide();
    });
    
    _handleRefresh();
  }

  Future<Null> _handleRefresh() async{
//    HomeDao.fetch().then((result){
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e){
//      setState(() {
//        resultString = e.toString();
//      });
//    });

      try{
        HomeModel model = await HomeDao.fetch();
        setState(() {
          localNavList = model.localNavList;
          gridNavModel = model.gridNav;
          subNavList = model.subNavList;
          salesBox = model.salesBox;
          bannerList = model.bannerList;
          _loading = false;
        });
      }catch (e){
        setState(() {
          print(e);
          _loading = false;
        });
      }
      return null;

  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              // 上拉刷新
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      //滚动且是列表滚动的时候
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return null;
                  },
                  child: _listView,
                ),
              )
            ),
            _appBar
          ],
        ),
      )
    );
  }

  _jumpToSearch(){
    Navigator.push(context, MaterialPageRoute(builder:
        (context)=> SearchPage(hint: SEARCH_BAR_DEFAULT_TEXT,)));

  }

  _jumpToSpeak() {
    Navigator.push(context, MaterialPageRoute(builder:
        (context)=> SpeakPage()));
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // AppBar渐变遮造背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2 ?
              SearchBarType.homeLight :
              SearchBarType.home,
              inputBoxClick:  _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: (){},
            ),
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]
          ),
        )
      ],
    );



//    Opacity(
//      opacity: appBarAlpha,
//      child: Container(
//        height: 80,
//        decoration: BoxDecoration(color: Colors.white),
//        child: Center(
//          child: Padding(
//            padding: EdgeInsets.only(top: 20),
//            child: Text('首页'),
//          ),
//        ),
//      ),
//    );
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        Container(
          height: 160,
          child: Swiper(
            itemCount: bannerList.length,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context){
                        CommonModel model = bannerList[index];
                        return WebView(
                          url: model.url,
                          title: model.title,
                          hideAppBar: model.hideAppBar,
                        );
                      })
                  );
                },
                child: Image.network(
                  bannerList[index].icon,
                  fit: BoxFit.fill,
                ),
              );
            },
            pagination: SwiperPagination(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(localNavList: localNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNav(gridNavModel: gridNavModel),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SubNav(subNavList: subNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBox(salesBox: salesBox),
        ),
      ],
    );
  }
}
