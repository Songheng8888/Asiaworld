class NotificationModel {
  // final int? id;
  final String? comment;
  // final int? scrop;
  final String? date;
  final String? fromDate;
  final String? tillDate;
  final String title;

  NotificationModel({
    required this.comment,
    required this.date,
    required this.fromDate,
    //  required this.id,
    // required this.scrop,
    required this.tillDate,
    required this.title,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        comment: json['comment'] == null ? "" : json['comment'],
        date: json['date'] == null ? "" : json['date'],
        fromDate: json['from_date'] == null ? "" : json['from_date'],
        // id: json['id'] == null ? "" : json['id'],
        // scrop: json['scope'] == null ? "" : json['scope'],
        tillDate: json['till_date'] == null ? "" : json['till_date'],
        title: json['title']);
  }
}
