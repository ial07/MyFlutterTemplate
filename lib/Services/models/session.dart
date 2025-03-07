import 'user.dart';

class Session {
  String? token;
  String? app;
  User? user;

  Session({required this.token, required this.app, this.user});

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    token: json['token'],
    app: json['app'],
    user: User.fromJson(json['user']),
  );

  static Session fromResponse(Map<String, dynamic> json) {
    return Session(
      token: json['token'],
      app: json['app'],
      user: json['user'] ?? User.fromJson(json['user']),
    );
  }
}
