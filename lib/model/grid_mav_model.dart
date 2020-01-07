import 'package:flutter_trip/model/common_model.dart';

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel,this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String,dynamic>json){
    return json !=null ?
        GridNavModel(
          hotel: GridNavItem.fromJson(json['hotel']),
          flight: GridNavItem.fromJson(json['flight']),
          travel: GridNavItem.fromJson(json['travel']),
        )
        : null;
  }
  Map<String, dynamic>toJson(){
    return {
      'hotel': hotel,
      'flight': flight,
      'travel': travel
    };
  }
}

//"startColor": "4b8fed",
//"endColor": "53bced",
//"mainItem": {
//"title": "机票",
//"icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png",
//"url": "https://m.ctrip.com/html5/flight/swift/index"
//},
//"item1": {
//"title": "火车票",
//"url": "https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539",
//"hideAppBar": true
//},
class GridNavItem{
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(
      {this.startColor,
        this.endColor,
        this.mainItem,
        this.item1,
        this.item2,
        this.item3,
        this.item4
      });
  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: CommonModel.fromJson(json['mainItem']),
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4'])
    );
  }

  Map<String, dynamic> toJson(){
    return {
      startColor: startColor,
      endColor: endColor,
      'mainItem': mainItem,
      'item1': item1,
      'item2': item2,
      'item3': item3,
      'item4': item4
    };
  }
}