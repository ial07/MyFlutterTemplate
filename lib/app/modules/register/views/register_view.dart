import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/shared/widgets/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputForm(
                fieldName: "username",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.numeric(),
                ]),
              ),
              InputForm(
                fieldName: "email",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return ElevatedButton(
                  onPressed:
                      controller.formController.isLoading.value
                          ? null
                          : () {
                            controller.submitForm(_formKey);
                          },
                  child:
                      controller.formController.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Submit"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
