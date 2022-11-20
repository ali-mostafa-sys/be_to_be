import 'package:flutter/material.dart';
class SnackBarMessage {
  void showSnackBar(
      {required String message,
        required Color backgroundColor,
        required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
