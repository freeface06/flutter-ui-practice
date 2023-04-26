class Vacation {
  final int userId;
  final String userName;
  final int id;
  final String type;
  final DateTime date;

  Vacation({
    required this.userId,
    required this.userName,
    required this.id,
    required this.type,
    required this.date,
  });

  factory Vacation.fromJson(Map<String, dynamic> json) {
    return Vacation(
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      id: json['id'] as int,
      type: json['type'] as String,
      date: json['date'] as DateTime,
    );
  }
}
