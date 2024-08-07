import 'package:dfunc/dfunc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc_chat_2/models/forms/form_handler.dart';

extension AlertDialogConvenienceShowing on AlertDialog {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required List<AlertAction> actions,
    GlobalKey<FormState>? formKey,
    Widget? inputField,
    String? title,
    String? message,
    String? remark,
    Function()? onDismissed,
    bool? dismissible,
  }) async {
    dismissible ??= defaultTargetPlatform == TargetPlatform.android;

    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => _buildForm(
        formKey: formKey,
        child: _buildBodyDialog(
          context: context,
          actions: actions,
          formKey: formKey,
          inputField: inputField,
          title: title,
          message: message,
          remark: remark,
          onDismissed: onDismissed,
          dismissible: dismissible,
        ),
      ),
    ).then((_) => onDismissed?.call());
  }

  static Widget _buildForm({
    required Widget child,
    GlobalKey<FormState>? formKey,
  }) {
    return formKey?.let((formKey) => Form(key: formKey, child: child)) ?? child;
  }

  static Widget _buildBodyDialog({
    required BuildContext context,
    required List<AlertAction> actions,
    GlobalKey<FormState>? formKey,
    Widget? inputField,
    String? title,
    String? message,
    String? remark,
    Function()? onDismissed,
    bool? dismissible,
  }) {
    Widget widget;
    if (defaultTargetPlatform == TargetPlatform.android) {
      widget = _buildAndroidAlertDialog(
        context,
        formKey: formKey,
        title: title,
        message: message,
        remark: remark,
        inputField: inputField,
        actions: actions,
      );
    } else {
      widget = _buildIOSAlertDialog(
        context,
        formKey: formKey,
        title: title,
        message: message,
        remark: remark,
        inputField: inputField,
        actions: actions,
      );
    }

    if (dismissible == false) {
      widget = PopScope(
        canPop: false,
        child: widget,
      );
    }

    return widget;
  }

  static AlertDialog _buildAndroidAlertDialog(
    BuildContext context, {
    required List<AlertAction> actions,
    GlobalKey<FormState>? formKey,
    String? title,
    String? message,
    String? remark,
    Widget? inputField,
  }) {
    final textButtons = actions.map(
      (action) {
        return TextButton(
          onPressed: () {
            final onPressed = action.onPressed;

            if (action.shouldValidation && formKey != null) {
              FormHandler(
                formKey: formKey,
                onValidationPassed: () {
                  Navigator.of(context).pop();
                  onPressed?.let((onPressed) => onPressed());
                },
              ).call();
            } else {
              Navigator.of(context).pop();
              onPressed?.let((onPressed) => onPressed());
            }
          },
          child: Text(action.title),
        );
      },
    ).toList();

    return AlertDialog(
      title: (title == null) ? null : Text(title),
      content: (message == null && inputField == null && remark == null)
          ? null
          : SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (message != null) Text(message),
                  if (inputField != null) inputField,
                  if (remark != null) ...[
                    const SizedBox(height: 8),
                    Text(remark),
                  ],
                ],
              ),
            ),
      actions: (textButtons.length <= 2)
          ? textButtons
          : [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: textButtons,
              ),
            ],
    );
  }

  static CupertinoAlertDialog _buildIOSAlertDialog(
    BuildContext context, {
    required List<AlertAction> actions,
    GlobalKey<FormState>? formKey,
    String? title,
    String? message,
    Widget? inputField,
    String? remark,
  }) {
    return CupertinoAlertDialog(
      title: (title == null) ? null : Text(title),
      content: (message == null && inputField == null)
          ? null
          : SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (message != null) Text(message),
                  if (inputField != null)
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: inputField,
                    ),
                  if (remark != null) ...[
                    const SizedBox(height: 8),
                    Text(remark),
                  ],
                ],
              ),
            ),
      actions: actions.map(
        (action) {
          return CupertinoDialogAction(
            onPressed: () {
              final onPressed = action.onPressed;

              if (action.shouldValidation && formKey != null) {
                FormHandler(
                  formKey: formKey,
                  onValidationPassed: () {
                    Navigator.of(context).pop();
                    onPressed?.let((onPressed) => onPressed());
                  },
                ).call();
              } else {
                Navigator.of(context).pop();
                onPressed?.let((onPressed) => onPressed());
              }
            },
            child: Text(action.title),
          );
        },
      ).toList(),
    );
  }
}

class AlertAction {
  AlertAction(
    this.title, {
    this.style,
    this.onPressed,
    this.shouldValidation = false,
  });

  final String title;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final bool shouldValidation;
}
