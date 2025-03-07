class SigninRequest {
  String UserID;
  String Password;
  String App;

  SigninRequest({
    required this.UserID,
    required this.Password,
    required this.App,
  });

  Map<String, dynamic> toJson() => {
    "UserID": UserID,
    "Password": Password,
    "Application": App,
  };
}
