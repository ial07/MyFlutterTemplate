import 'package:dio/dio.dart';
import '../models/models.dart';
import '../utils/dio_client.dart';

class PostService {
  final Dio dio = DioClient.instance; // Use the global Dio instance

  Future<List<Post>> fetchPosts() async {
    try {
      Response response = await dio.get("posts");
      if (response.statusCode == 200) {
        var jsonData = response.data;
        if (jsonData is List) {
          return jsonData
              .map((e) => Post.fromJson(Map<String, dynamic>.from(e)))
              .toList();
        }
      }
      throw Exception("Failed to load posts");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
