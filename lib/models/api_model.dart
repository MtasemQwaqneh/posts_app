class ApiModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  ApiModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory ApiModel.fromJosn(Map<String, dynamic> json) {
    return ApiModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
