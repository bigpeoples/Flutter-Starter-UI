class YGCommentDataModel {
  String? text;
  String? profileImage;
  List<YGImageData>? image;
  String? date;
  String? name;

  YGCommentDataModel({this.text, this.profileImage, this.image, this.date, this.name});
}

class YGImageData {
  String? image;

  YGImageData({this.image});
}
