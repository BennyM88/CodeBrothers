import 'package:code_brothers/constants.dart';
import 'package:flutter/material.dart';

import 'pages/comments_page.dart';
import 'pages/photos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  void _navigate(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List<Widget> _pages = [
    const PhotosPage(),
    const CommentsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        selectedItemColor: primaryColor,
        onTap: _navigate,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Photos'),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comments'),
        ],
      ),
    );
  }
}
