import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:linusplayer/views/base/bottom_music_container.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMusicContainer(),
      body: Center(
        child: Text(
          "library",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
