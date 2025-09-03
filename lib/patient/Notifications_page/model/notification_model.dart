class NotificationModel {
  String title = 'hi';
  String details = ' hi';
  String time = ' hi';

  NotificationModel({
  required this.details,
  required this.title,
  required this.time
  });

factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      details: json['body'],
      time: DateTime.parse(json['created_at']).toString(),
    );
  }

}
