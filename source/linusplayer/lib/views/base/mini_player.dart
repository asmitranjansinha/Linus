// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/controller/song_controller.dart';

import '../../constants/images.dart';
import '../music_player/music_player_screen.dart';

class BottomMusicContainer extends StatefulWidget {
  const BottomMusicContainer({super.key});

  @override
  State<BottomMusicContainer> createState() => _BottomMusicContainerState();
}

class _BottomMusicContainerState extends State<BottomMusicContainer> {
  @override
  void initState() {
    SongController.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => MusicPlayerScreen(
                  playersong: SongController.playingSongs,
                ),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 900));
      },
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() async {
                    if (SongController.player.hasPrevious) {
                      await SongController.player.seekToPrevious();
                      await SongController.player.play();
                    } else {
                      await SongController.player.play();
                    }
                  });
                },
                borderRadius: BorderRadius.circular(60 / 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60 / 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      Images.previous,
                      scale: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60 / 2),
                onTap: () {
                  setState(() {
                    if (SongController.player.playing) {
                      SongController.player.pause();
                    } else {
                      SongController.player.play();
                    }
                  });
                },
                child: StreamBuilder<bool>(
                  stream: SongController.player.playingStream,
                  builder: (context, snapshot) {
                    bool? playingStage = snapshot.data;
                    if (playingStage != null && playingStage) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(60 / 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              Images.pause,
                              color: Colors.white,
                              scale: 10,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(60 / 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Image.asset(
                                Images.play,
                                scale: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() async {
                    if (SongController.player.hasNext) {
                      await SongController.player.seekToNext();
                      await SongController.player.play();
                    } else {
                      await SongController.player.play();
                    }
                  });
                },
                borderRadius: BorderRadius.circular(60 / 2),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60 / 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      Images.next,
                      scale: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
