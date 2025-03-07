import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var isSubmitted = false.obs; // Track form submission

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setError(String error) {
    errorMessage.value = error;
  }

  void clearError() {
    errorMessage.value = "";
  }

  void submitForm(GlobalKey<FormState> formKey) {
    isSubmitted.value = true; // Mark form as submitted
  }
}
