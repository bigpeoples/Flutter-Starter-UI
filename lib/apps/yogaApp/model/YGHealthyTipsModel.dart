class YGHealthDataModel {
  String? url;
  String? text;

  YGHealthDataModel({this.url, this.text});
}

class HealthTopicDataModel {
  String? url;
  String? text;
  int? like;
  bool? isLike;
  int? comment;

  HealthTopicDataModel({this.url, this.text, this.comment, this.like, this.isLike});
}
