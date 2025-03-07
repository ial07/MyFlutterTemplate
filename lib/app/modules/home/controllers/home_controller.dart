import 'package:flutter_application_1/Services/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var posts = <Post>[].obs;
  var errorMessage = "".obs;

  final PostService postService = PostService();

  @override
  void onInit() {
    super.onInit();
    fetchPosts(); // Fetch posts when the controller initializes
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      posts.value = await postService.fetchPosts();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
