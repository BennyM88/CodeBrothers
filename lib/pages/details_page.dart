import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_brothers/constants.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String url;
  const DetailsPage({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: titleSize),
              ),
              CachedNetworkImage(
                imageUrl: widget.url,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
