class FBUserModel {
  String? email;
  String? fullName;
  String? password;
  String? id;

  FBUserModel({this.id, this.email, this.fullName, this.password});

  factory FBUserModel.fromJson(Map<String, dynamic> json) {
    return FBUserModel(
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['password'] = this.password;
    data['id'] = this.id;
    return data;
  }
}
