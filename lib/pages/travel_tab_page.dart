/**
 * 《Flutter从入门到进阶-实战携程网App》
 * 课程地址：
 * https://coding.imooc.com/class/321.html
 * 课程代码、文档：
 * https://git.imooc.com/coding-321/
 * 课程辅导答疑区：
 * http://coding.imooc.com/learn/qa/321.html
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/travel_dao.dart';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const PAGE_SIZE = 10;
const TRAVEL_URL = 'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031099210284254083&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';
    //'https//m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&';

class TravelTabPage extends StatefulWidget {
  final String travelUrl;
  final String groupChannelCode;

  const TravelTabPage({Key key, this.travelUrl, this.groupChannelCode}) : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage> {
  List<TravelItem> travelItems;
  int pageIndex = 1;

  @override
  void initState() {
    _lodaData();
    super.initState();
  }

  void _lodaData() {
    TravelDao.fetch(widget.travelUrl??TRAVEL_URL, widget.groupChannelCode, pageIndex, PAGE_SIZE)
        .then((TravelItemModel model){
          setState(() {
            List<TravelItem> items = _filterItems(model.resultList);
            if(travelItems != null){
              travelItems.addAll(items);
            }else{
              travelItems = items;
            }
          });
    }).catchError((e){
      print(e);
    });
  }

  List<TravelItem> _filterItems(List<TravelItem> resultList){
    if(resultList == null) return [];
    List<TravelItem> filterItems = [];
    resultList.forEach((item){
      if(item.article != null) {
        filterItems.add(item); //移除article为空的值
      }
    });
    return filterItems;
  }

  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => new Container(
            color: Colors.green,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }
}
