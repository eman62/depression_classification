class NotificationModel {

  String? text;

  NotificationModel({
    this.text,
  });
  NotificationModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
