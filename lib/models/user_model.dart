class AppUserModel {
  String? name;
  String? age;
  String? email;
  String? image;
  String? twitter;
  String? uId;
  bool? admin;
  bool? isEmailVerified;
  bool? isLocked;

  AppUserModel({
    this.email,
    this.age,
    this.name,
    this.twitter,
    this.uId,
    this.isEmailVerified,
    this.image,
    this.admin,
    this.isLocked,
  });

  AppUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    age = json['age'];
    name = json['name'];
    twitter = json['twitter'];
    uId = json['uId'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
    admin = json['admin'];
    isLocked = json['isLocked'] ?? false;
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'age': age,
      'name': name,
      'image': image,
      'twitter': twitter,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'admin': admin,
      'isLocked': isLocked,
    };
  }
}
