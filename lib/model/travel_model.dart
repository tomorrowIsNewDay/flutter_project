
// 旅拍页面模型
import 'dart:html';

class TravelModel {
  int totalCount;
  List<TravelItem> resultList;

  TravelModel({this.totalCount,this.resultList});

  TravelModel.fromJson(Map<String,dynamic> json){
    totalCount = json['url'];
    if(json['resultList'] != null) {
      resultList = new List<TravelItem>();
      json['resultList'].forEach((v){
        resultList.add(new TravelItem.formJson(v));
      });
    }
  }

  Map<String, dynamic>toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['totalCount'] = this.totalCount;
    if(this.resultList != null) {
      data['resultList'] = this.resultList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelItem {
  int type;
  Article article;

  TravelItem({this.type, this.article});

  TravelItem.formJson(Map<String, dynamic> json) {
    type = json['type'];
    article = json['article'] != null ? new Article.formJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['type'] = this.type;
    if(this.article != null) {
      data['article'] = this.article.toJson();
    }
    return data;
  }
}

class Article {
  int articleId;
  String articleType;
  int productType;
  int sourceType;
  String articleTitle;
  Author author;
  List<Images> images;
  bool hasVideo;
  int readCount;
  int likeCount;
  int commentCount;
  List<Urls> urls;

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    articleType = json['articleType'];
  }

}

