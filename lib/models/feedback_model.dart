class FeedbackModel {
  String? name;
  String? uId;
  String? text;
  String? image;

  FeedbackModel({
    this.name,
    this.uId,
    this.image,
    this.text,
  });
  FeedbackModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    text = json['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'uId': uId,
      'text': text,
    };
  }
}
