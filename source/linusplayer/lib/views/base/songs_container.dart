import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constants/images.dart';

class SongsContainer extends StatelessWidget {
  final onTap;
  final songTitle;
  final artistName;
  const SongsContainer(
      {super.key,
      required this.songTitle,
      required this.artistName,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: size.width / 1.2,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songTitle,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1),
                    ),
                    Text(
                      artistName,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white60,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1),
                    )
                  ],
                ),
                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(60 / 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Images.play,
                        scale: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(60 / 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Image.asset(
                      Images.moreGraphic,
                      scale: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
