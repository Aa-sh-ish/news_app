import 'package:flutter/material.dart';
import 'package:news_app/core/pages/BookMark/bookMark.dart';
import 'package:news_app/core/pages/HomePage/home_page.dart';
import 'package:news_app/core/pages/Profile/profile.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const BookMark(),
    const ProfilePage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
