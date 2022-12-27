import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../favourite/favourite_database.dart';

class FavButton extends StatefulWidget {
  final SongModel song;
  const FavButton({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: FavaroiteDb.favaroiteList,
      builder: (BuildContext context, List<SongModel> favorSong, Widget? _) {
        return IconButton(
          onPressed: () {
            if (FavaroiteDb.isFavor(widget.song)) {
              FavaroiteDb.removeSong(widget.song.id);
              FavaroiteDb.favaroiteList.notifyListeners();
              const snackBar = SnackBar(
                content: Text('Removed from Favorites'),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              FavaroiteDb.addSong(widget.song);
              FavaroiteDb.favaroiteList.notifyListeners();
              const snackBar = SnackBar(
                content: Text('Added to Favorites'),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            FavaroiteDb.favaroiteList.notifyListeners();
          },
          icon: FavaroiteDb.isFavor(widget.song)
              ? SizedBox(
                  height: size.height / 10,
                  child: Lottie.asset('assets/images/favourite_animation.json'))
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
        );
      },
    );
  }
}
