import 'package:flutter/material.dart';
import 'package:linusplayer/views/base/bottom_music_container.dart';
import 'package:linusplayer/views/base/search_field.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomMusicContainer(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Your Favourites ❥",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height / 100,
              ),
              SearcxhField(hintText: "Find in Favourite Songs")
            ],
          ),
        )));
  }
}
