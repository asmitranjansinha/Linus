import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:linusplayer/views/base/bottom_navigartion_bar.dart';
import 'package:lottie/lottie.dart';

import '../../constants/images.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _likeController;

  bool _liked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _likeController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(60 / 2),
                    onTap: () {
                      Get.off(() => BottomNavigation(),
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 500));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60 / 2)),
                      child: Center(
                        child: Image.asset(
                          Images.downArrowGraphic,
                          scale: 15,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Now Playing",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    child: Image.asset(
                      Images.musicLibraryGraphic,
                      scale: 14,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 60)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child:
                      Center(child: Image.asset(Images.musicAlbumArtGraphic)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(60 / 2),
                  onTap: () {
                    if (_liked == false) {
                      _liked = true;
                      _likeController.forward();
                    } else {
                      _liked = false;
                      _likeController.reverse();
                    }
                  },
                  child: SizedBox(
                    height: size.height / 10,
                    child: Lottie.asset(
                        "assets/images/favourite_animation.json",
                        controller: _likeController),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Song Title",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: size.height / 100,
                    ),
                    const Text(
                      "Artist",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Image.asset(
                    Images.moreOptionsGraphic,
                    scale: 17,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 15,
            ),
            SizedBox(
                width: size.width / 1.5,
                child: AdvancedSeekBar(
                  Colors.white,
                  2,
                  Colors.red,
                  lineHeight: 5,
                )),
            SizedBox(
              height: size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Images.shuffle,
                  scale: 20,
                ),
                Image.asset(
                  Images.previous,
                  scale: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60 / 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Image.asset(
                        Images.play,
                        scale: 18,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  Images.next,
                  scale: 15,
                ),
                Image.asset(
                  Images.repeat,
                  scale: 20,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
