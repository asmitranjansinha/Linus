import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:get/get.dart';
import 'package:linusplayer/controller/song_controller.dart';
import 'package:linusplayer/views/base/fav_button.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../constants/images.dart';

class MusicPlayerScreen extends StatefulWidget {
  final List<SongModel> playersong;
  const MusicPlayerScreen({
    super.key,
    required this.playersong,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _likeController;

  final Duration _duration = const Duration();
  final Duration _position = const Duration();
  int currentIndex = 0;

  bool _liked = false;
  bool isPlaying = false;

  @override
  void initState() {
    _likeController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 5));
    SongController.player.currentIndexStream.listen((index) {
      if (index != null && mounted) {
        setState(() {
          currentIndex = index;
        });
        SongController.currentIndex = index;
      }
    });
    isPlaying = true;
    super.initState();
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
                    onTap: () => Get.back(),
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
                height: size.height / 2.7,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 60)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(65)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: widget.playersong.isNotEmpty
                      ? QueryArtworkWidget(
                          id: widget.playersong[currentIndex].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: Image.asset(
                            Images.musicAlbumArtGraphic,
                          ),
                        )
                      : Center(child: Image.asset(Images.musicAlbumArtGraphic)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.playersong.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: FavButton(song: widget.playersong[currentIndex]),
                      )
                    : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        widget.playersong.isNotEmpty
                            ? widget.playersong[currentIndex].displayNameWOExt
                            : "Song Title",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2),
                      ),
                      SizedBox(
                        height: size.height / 100,
                      ),
                      Text(
                        widget.playersong.isNotEmpty
                            ? widget.playersong[currentIndex].artist.toString()
                            : "Artist",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (SongController.player.hasPrevious) {
                        SongController.player.seekToPrevious();
                        SongController.player.play();
                      } else {
                        SongController.player.play();
                      }
                      isPlaying = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(60 / 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        Images.previous,
                        scale: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(60 / 2),
                  onTap: () {
                    setState(() {
                      if (isPlaying) {
                        SongController.player.pause();
                      } else {
                        SongController.player.play();
                      }
                      isPlaying = !isPlaying;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Image.asset(
                          isPlaying ? Images.pause : Images.play,
                          scale: 18,
                        ),
                      ),
                    ),
                  ),
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
                      isPlaying = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(60 / 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        Images.next,
                        scale: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
