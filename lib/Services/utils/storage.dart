import 'package:localstorage/localstorage.dart';

class SessionToken {
  static const key = "TOKEN";
  static LocalStorage storage = LocalStorage("my_app");

  static Future<void> store(String token) async {
    storage.setItem(key, token);
  }

  static Future<String?> read() async {
    return await storage.getItem(key);
  }
}
