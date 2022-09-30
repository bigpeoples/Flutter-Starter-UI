class YGTopicDataModel {
  String? text;
  List<YGPostImage>? image;
  String? date;
  bool? like;

  YGTopicDataModel({this.text, this.image, this.date, this.like});
}

class YGPostImage {
  String? image;

  YGPostImage({this.image});
}
