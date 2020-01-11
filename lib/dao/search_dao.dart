import 'dart:async';
import 'dart:convert';
import 'package:flutter_trip/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchDao {
  static Future<SearchModel> fetch(String url, String text) async {
    final response = await http.get(url);
    if(response.statusCode == 200) {
      //解决中文乱码问题
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      // 这里调用接口时传入keyword, 然后响应时返回，
      // 供客户端去对比，避免短时间内频繁输入，导致输入和查询的数据不匹配
      model.keyword = text;
      return model;
    }else{
      throw Exception('failed to load search');
    }
  }
}