import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/views/base/bottom_music_container.dart';
import 'package:linusplayer/views/base/text_container.dart';
import 'package:linusplayer/views/library/all_songs_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

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
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Library",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              TextContainer(
                textData: "All Songs",
                onTap: () {
                  Get.to(() => AllSongsPage(),
                      transition: Transition.cupertinoDialog);
                },
              )
            ],
          ),
        )));
  }
}
