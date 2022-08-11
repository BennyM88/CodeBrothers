import 'package:flutter/material.dart';

Widget customRefreshButton(VoidCallback onPressed) {
  return Center(
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh),
      label: const Text('Refresh'),
    ),
  );
}
