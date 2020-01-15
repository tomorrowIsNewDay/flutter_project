
// 旅拍页面模型
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
  List<Null> tags;
  List<Topics> topics;
  List<Pois> pois;
  String publishTime;
  String publishTimeDisplay;
  String shootTime;
  String shootTimeDisplay;
  int level;
  String distanceText;
  bool isLike;
  int imageCounts;
  bool isCollected;
  int collectCount;
  int articleStatus;
  String poiName;

  Article({
    this.articleId,
    this.articleType,
    this.productType,
    this.sourceType,
    this.articleTitle,
    this.author,
    this.images,
    this.hasVideo,
    this.readCount,
    this.likeCount,
    this.commentCount,
    this.urls,
    this.tags,
    this.topics,
    this.pois,
    this.publishTime,
    this.publishTimeDisplay,
    this.shootTime,
    this.shootTimeDisplay,
    this.level,
    this.distanceText,
    this.isLike,
    this.imageCounts,
    this.isCollected,
    this.collectCount,
    this.articleStatus,
    this.poiName,
  })

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    articleType = json['articleType'];
    productType = json['productType'];
    sourceType = json['sourceType'];
    articleTitle = json['articleTitle'];
    author = json['anthor'] != null ? new Author.fromJson(json['anthor']) : null;
    if(json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v){
        images.add(new Images.fromJson(v));
      })
    }
    hasVideo = json['hasVideo'];
    readCount = json['readCount'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
//    if(json['urls'] != null) {
//      urls = new List<Urls>();
//      json['urls'].forEach((v){
//        urls.add(new Urls.fromJson(v));
//      })
//    }
    if(json['tags'] != null) {
      tags = new List<Null>();
      json['tags'].forEach((v){
        tags.add(new Null.fromJson(v));
      })
    }
    if(json['topics'] != null) {
      topics = new List<Topics>();
      json['topics'].forEach((v){
        topics.add(new Topics.fromJson(v));
      })
    }
    if(json['pois'] != null) {
      pois = new List<Pois>();
      json['pois'].forEach((v){
        pois.add(new Pois.fromJson(v));
      })
    }
    publishTime = json['publishTime'];
    publishTimeDisplay = json['publishTimeDisplay'];
    shootTime = json['shootTime'];
    shootTimeDisplay = json['shootTimeDisplay'];
    level = json['level'];
    distanceText = json['distanceText'];
    isLike = json['isLike'];
    imageCounts = json['imageCounts'];
    isCollected = json['isCollected'];
    collectCount = json['collectCount'];
    articleStatus = json['articleStatus'];
    poiName = json['poiName'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['articleId'] = this.articleId;
    data['articleType'] = this.articleType;
    data['productType'] = this.productType;
    data['sourceType'] = this.sourceType;
    data['articleTitle'] = this.articleTitle;
    if(this.anthor != null) {
      data['anthor'] = this.anthor.toJson();
    }
    if(this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }

    return data;

  }

}

class Author {
  int authorId;
  String nickName;
  String clientAuth;
  String jumpUrl;
  CoverImage coverImage;
  int identityType;
  String tag;

  Author({
    this.authorId,
    this.nickName,
    this.clientAuth,
    this.jumpUrl,
    this.coverImage,
    this.identityType,
    this.tag,
  })

  Author.fromJson(Map<String, dynamic> json) {
    authorId = json['authorId'];
    nickName = json['nickName'];
    clientAuth = json['clientAuth'];
    jumpUrl = json['jumpUrl'];
    coverImage = json['coverImage'] != null ?
        new CoverImage.fromJson(json['coverImage']) : null;

    identityType = json['identityType'];
    tag = json['tag'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['authorId'] = this.authorId;
    data['nickName'] = this.nickName;
    data['clientAuth'] = this.clientAuth;
    data['jumpUrl'] = this.jumpUrl;
    data['identityType'] = this.identityType;
    data['tag'] = this.tag;
    if(this.coverImage != null) {
      data['coverImage'] = this.coverImage.toJson();
    }

    return data;

  }

}


class CoverImage {
  String dynamicUrl;
  String originalUrl;

  CoverImage({this.dynamicUrl, this.originalUrl})

  CoverImage.fromJson(Map<String, dynamic> json) {
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['dynamicUrl'] = this.dynamicUrl;
    data['originalUrl'] = this.originalUrl;
    return data;
  }
}

class Images {
  int imageId;
  String dynamicUrl;
  String originalUrl;
  int width;
  int height;
  int mediaType;
  bool isWaterMarked;

  Images({this.imageId, this.dynamicUrl, this.originalUrl, this.width, this.heigth, this.mediaType, this.isWaterMarked})

  Images.fromJson(Map<String, dynamic> json) {
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];
    imageId = json['imageId'];
    width = json['width'];
    height = json['height'];
    mediaType = json['mediaType'];
    isWaterMarked = json['isWaterMarked'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['dynamicUrl'] = this.dynamicUrl;
    data['originalUrl'] = this.originalUrl;
    data['imageId'] = this.imageId;
    data['width'] = this.width;
    data['height'] = this.height;
    data['mediaType'] = this.mediaType;
    data['isWaterMarked'] = this.isWaterMarked;
    return data;
  }
}

class Urls {
  String version;
  String appUrl;
  String h5Url;
  String wxUrl;


  Urls({this.version, this.appUrl, this.h5Url, this.wxUrl})

  Urls.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    appUrl = json['appUrl'];
    h5Url = json['h5Url'];
    wxUrl = json['wxUrl'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['version'] = this.version;
    data['appUrl'] = this.appUrl;
    data['h5Url'] = this.h5Url;
    data['wxUrl'] = this.wxUrl;

    return data;
  }
}

class Topics {
  int topicId;
  String topicName;
  int level;


  Topics({this.topicId, this.topicName, this.level})

  Topics.fromJson(Map<String, dynamic> json) {
    topicId = json['topicId'];
    topicName = json['topicName'];
    level = json['level'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['topicId'] = this.topicId;
    data['topicName'] = this.topicName;
    data['level'] = this.level;

    return data;
  }
}

class Pois {
  int poiType;
  int poiId;
  String poiName;
  int businessId;
  int districtId;
  PoiExt poiExt;
  int source;
  int isMain;
  bool isInChina;
  String countryName;


  Pois({this.poiType, this.poiId, this.poiName, this.businessId, this.districtId, this.poiExt, this.source, this.isMain , this.isInChina, this.countryName })

  Pois.fromJson(Map<String, dynamic> json) {
    poiType = json['poiType'];
    poiId = json['poiId'];
    poiName = json['poiName'];
    businessId = json['businessId'];
    districtId = json['districtId'];
    source = json['source'];
    isMain = json['isMain'];
    isInChina = json['isInChina'];
    countryName = json['countryName'];
    poiExt = json['poiExt'] != null ? new PoiExt.fromJson(json['poiExt']) : null;

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['poiType'] = this.poiType;
    data['poiId'] = this.poiId;
    data['poiName'] = this.poiName;
    data['businessId'] = this.businessId;
    data['districtId'] = this.districtId;
    data['source'] = this.source;
    data['isMain'] = this.isMain;
    data['isInChina'] = this.isInChina;
    data['countryName'] = this.countryName;
    if(this.poiExt != null) {
      data['poiExt'] = this.poiExt.toJson();
    }

    return data;
  }
}

class PoiExt {
  String h5Url;
  String appUrl;


  PoiExt({this.h5Url, this.h5Url})

  PoiExt.fromJson(Map<String, dynamic> json) {
    h5Url = json['h5Url'];
    appUrl = json['appUrl'];

  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['h5Url'] = this.h5Url;
    data['appUrl'] = this.appUrl;

    return data;
  }
}

