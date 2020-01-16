import 'dart:async';
import 'dart:convert';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:http/http.dart' as http;

var Params = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1", //"""RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {},
  "contentType": "json"
};

// 旅拍页接口
class TravelDao {
  static Future<TravelItemModel> fetch(
      String url,
      String groupChannelCode,
      int pageIndex,
      int pageSize) async {
//    Map paramsMap = Params['pagePara'];
//    paramsMap['pageIndex'] = pageIndex;
//    paramsMap['pageSize'] = pageSize;
    print('发地方');
//    paramsMap['groupChannelCode'] = groupChannelCode;
    print('12312');
    final response = await http.post(url, body: jsonEncode(Params));
    if(response.statusCode == 200) {
      //解决中文乱码问题
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelItemModel.fromJson(result);
    }else{
      throw Exception('failed to load travel');
    }
  }
}