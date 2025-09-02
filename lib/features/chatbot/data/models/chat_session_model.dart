class ChatSessionModel {
  final String id;
  final String title;
  final String status;
  final String statusColor;
  final String timeStamp;

  ChatSessionModel({
    required this.id,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'statusColor': statusColor,
      'timeStamp': timeStamp,
    };
  }

  factory ChatSessionModel.fromJson(Map<String, dynamic> json) {
    return ChatSessionModel(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      statusColor: json['statusColor'],
      timeStamp: json['timeStamp'],
    );
  }
}
