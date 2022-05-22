class FriendModel {
  String? name;
  String? phone;
  FriendModel({
    this.name,
    this.phone,
  });

  FriendModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}