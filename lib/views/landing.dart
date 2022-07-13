import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/views/bookmark.dart';
import 'package:quran_app/views/doa.dart';

import 'home.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late int _bottomNavIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _bottomNavIndex = newIndex;
          });
        },
        children: const [
          Home(),
          Doa(),
          Bookmark(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        fixedColor: const Color.fromRGBO(103, 44, 188, 1),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(
            () {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.ease);
            },
          );
        },
        currentIndex: _bottomNavIndex,
        items: const [
          // Home
          BottomNavigationBarItem(
              activeIcon: Icon(
                Ionicons.home,
                color: Color.fromRGBO(103, 44, 188, 1),
              ),
              icon: Icon(
                Ionicons.home_outline,
                color: Color.fromRGBO(135, 137, 163, 1),
              ),
              label: "Beranda"),

          // Doa
          BottomNavigationBarItem(
              activeIcon: Icon(
                Ionicons.book,
                color: Color.fromRGBO(103, 44, 188, 1),
              ),
              icon: Icon(
                Ionicons.book_outline,
                color: Color.fromRGBO(135, 137, 163, 1),
              ),
              label: "Do'a & Dzikir"),

          // Bookmark
          BottomNavigationBarItem(
              activeIcon: Icon(
                Ionicons.bookmark,
                color: Color.fromRGBO(103, 44, 188, 1),
              ),
              icon: Icon(
                Ionicons.bookmark_outline,
                color: Color.fromRGBO(135, 137, 163, 1),
              ),
              label: "Bookmark"),
        ],
      ),
    );
  }
}
