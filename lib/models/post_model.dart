class PostModel {
  String? name;
  String? image;
  String? uId;
  String? dateTime;
  String? text;
  String? postImage;
  int? likesCount;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
    this.likesCount,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    text = json['text'];
    dateTime = json['dateTime'];
    postImage = json['postImage'];
    likesCount = json['likes'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'uId': uId,
      'text': text,
      'postImage': postImage,
      'dateTime': dateTime,
      'likes': likesCount,
    };
  }
}
