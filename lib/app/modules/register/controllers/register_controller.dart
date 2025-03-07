import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/shared/helpers/FormController.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FormController formController = Get.put(FormController());

  final List<String> fields = ['username', 'email', 'password'];

  @override
  void onInit() {
    super.onInit();
    for (var field in fields) {
      formController.initController(field);
    }
  }

  /// ✅ Function to handle form submission
  void submitForm(GlobalKey<FormState> formKey) async {
    formController.onSubmitForm(
      formKey,
    ); // Calls FormController's submission logic
  }

  @override
  void onClose() {
    formController.onClose();
    super.onClose();
  }
}
