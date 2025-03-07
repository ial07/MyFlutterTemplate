import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BaseController.dart';

class FormController extends BaseController {
  final Map<String, TextEditingController> controllers = {};
  final Map<String, RxString> errorMessages = {};

  void initController(String fieldName) {
    controllers.putIfAbsent(fieldName, () => TextEditingController());
    errorMessages.putIfAbsent(fieldName, () => "".obs);
  }

  TextEditingController getController(String fieldName) {
    return controllers[fieldName]!;
  }

  /// ✅ Renamed to `setFieldError` to avoid conflict with `BaseController.setError`
  void setFieldError(String fieldName, String? error) {
    Future.delayed(Duration.zero, () {
      errorMessages[fieldName]?.value = error ?? "";
    });
  }

  /// ✅ Submit function to validate the form
  void onSubmitForm(GlobalKey<FormState> formKey) {
    setLoading(true);
    isSubmitted.value = true; // Mark form as submitted
    formKey.currentState?.validate();
    setLoading(false);
  }

  @override
  void onClose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.onClose();
  }
}
