import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/FormController.dart';

class InputForm extends StatelessWidget {
  final String fieldName;
  final Widget? prefix;
  final String? Function(String?)? validator;

  const InputForm({
    super.key,
    required this.fieldName,
    this.prefix,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<FormController>();
    formController.initController(fieldName);
    var size = context.mediaQuery.size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName.capitalizeFirst ?? "",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Obx(() {
            final errorText =
                formController.errorMessages[fieldName]?.value ?? "";
            final showError =
                formController.isSubmitted.value && errorText.isNotEmpty;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  child: TextFormField(
                    autovalidateMode:
                        AutovalidateMode.disabled, // Disable auto validation
                    controller: formController.getController(fieldName),
                    autocorrect: false,
                    validator: (value) {
                      final result = validator?.call(value);
                      formController.setFieldError(
                        fieldName,
                        result,
                      ); // ✅ Use setFieldError
                      return null; // Prevent showing error immediately
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: showError ? Colors.red : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: fieldName.capitalizeFirst,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: prefix,
                    ),
                  ),
                ),
                if (showError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          errorText,
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
