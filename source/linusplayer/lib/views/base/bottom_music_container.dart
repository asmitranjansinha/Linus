import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/views/music_player/music_player_screen.dart';

import '../../constants/images.dart';

class BottomMusicContainer extends StatelessWidget {
  const BottomMusicContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => MusicPlayerScreen(),
        //     transition: Transition.downToUp,
        //     duration: const Duration(milliseconds: 900));
      },
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 60)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                        Center(child: Image.asset(Images.musicAlbumArtGraphic)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  children: const [
                    Text(
                      "Song Title",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          letterSpacing: 0.5),
                    ),
                    Text(
                      "Artist",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.5),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Images.previous,
                    scale: 18,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Image.asset(
                          Images.play,
                          scale: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    Images.next,
                    scale: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
