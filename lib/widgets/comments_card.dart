import 'package:flutter/material.dart';

Widget customCommentCard(String name, String email, String body) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text('$name\n$email'),
        subtitle: Text(body),
      ),
    ),
  );
}
