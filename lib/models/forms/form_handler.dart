import 'package:flutter/material.dart';

class FormHandler {
  FormHandler({
    required this.formKey,
    this.onValidationPassed,
    this.onValidationFailed,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback? onValidationPassed;
  final VoidCallback? onValidationFailed;

  void call() {
    if (!formKey.currentState!.validate()) {
      onValidationFailed?.call();
    } else {
      onValidationPassed?.call();
    }
  }
}
