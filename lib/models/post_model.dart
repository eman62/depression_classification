class PostModel {
  String? name;
  String? image;
  String? uId;
  String? dateTime;
  String? text;
  String? postImage;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
  });
  PostModel.fromJson(Map <String,dynamic>json)
  {
    name =json['name'];
    uId =json['uId'];
    image =json['image'];
    text =json['text'];
    dateTime =json['dateTime'];
    postImage =json['postImage'];
  }
  Map <String,dynamic> toMap(){
    return {
      'name':name,
      'image':image,
      'uId':uId,
      'text':text,
      'postImage':postImage,
      'dateTime':dateTime,
    };
  }

}