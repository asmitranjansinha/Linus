import 'package:flutter/material.dart';
import 'package:linusplayer/constants/images.dart';
import 'package:linusplayer/views/favourite/favourite_page.dart';
import 'package:linusplayer/views/home/home_page.dart';
import 'package:linusplayer/views/library/library_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final screen = [const HomePage(), const LibraryPage(), const FavouritePage()];

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
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 1, height: 2),
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
