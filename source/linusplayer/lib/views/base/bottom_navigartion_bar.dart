import 'package:flutter/material.dart';
import 'package:linusplayer/constants/images.dart';
import 'package:linusplayer/views/favourite/favourite_page.dart';
import 'package:linusplayer/views/home/home_page.dart';
import 'package:linusplayer/views/library/library_page.dart';
import 'package:linusplayer/views/search/search_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final screen = [
    const HomePage(),
    const SearchPage(),
    const LibraryPage(),
    const FavouritePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screen[_selectedIndex],
      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700, letterSpacing: 2, height: 1.7),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.homeGraphic,
                scale: 18,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Images.searchGraphic,
                  scale: 18,
                ),
                label: "search"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Images.libraryGraphic,
                  scale: 18,
                ),
                label: "library"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Images.favouriteGraphic,
                  scale: 18,
                ),
                label: "favourite"),
          ],
        ),
      ),
    );
  }
}
