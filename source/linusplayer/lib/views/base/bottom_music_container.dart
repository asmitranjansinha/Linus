// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/controller/song_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SongController.player.currentIndex != null
                    ? QueryArtworkWidget(
                        id: SongController
                            .playingSongs[SongController.player.currentIndex!]
                            .id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: Image.asset(
                          Images.musicAlbumArtGraphic,
                          scale: 10,
                        ),
                      )
                    : Center(child: Image.asset(Images.musicAlbumArtGraphic)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  children: [
                    Text(
                      SongController.player.currentIndex != null
                          ? SongController
                              .playingSongs[SongController.player.currentIndex!]
                              .displayNameWOExt
                          : "Song Title",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 0.5),
                    ),
                    Text(
                      SongController.player.currentIndex != null
                          ? SongController
                              .playingSongs[SongController.player.currentIndex!]
                              .artist
                              .toString()
                          : "Artist",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          letterSpacing: 0.5),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(60 / 2)),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  Images.pause,
                                  color: Colors.white,
                                  scale: 15,
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
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          Images.next,
                          scale: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
