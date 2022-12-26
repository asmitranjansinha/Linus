import 'package:flutter/material.dart';
import 'package:linusplayer/constants/images.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: BottomNavigationBar(
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
