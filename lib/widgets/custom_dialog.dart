import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        MaterialButton(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ),
  );
}
