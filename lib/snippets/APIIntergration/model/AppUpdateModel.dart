class AppUpdateModel {
  String? name;
  String? job;
  String? updatedAt;

  AppUpdateModel({this.name, this.job, this.updatedAt});

  factory AppUpdateModel.fromJson(Map<String, dynamic> json) {
    return AppUpdateModel(
      name: json['name'],
      job: json['job'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
