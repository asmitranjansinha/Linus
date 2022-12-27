import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linusplayer/views/base/songs_container.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/images.dart';
import '../base/bottom_music_container.dart';
import '../base/search_field.dart';

class AllSongsPage extends StatefulWidget {
  AllSongsPage({super.key});

  @override
  State<AllSongsPage> createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermision();
  }

  void requestPermision() {
    Permission.storage.request();
  }

  final _allAudio = new OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              Images.backGraphic,
              scale: 17,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "All Songs",
              style: TextStyle(
                  fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        bottomNavigationBar: BottomMusicContainer(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                SearcxhField(hintText: "Find in All Songs"),
                SizedBox(
                  height: size.height / 30,
                ),
                allSongsBody()
              ],
            ),
          )),
        ));
  }

  allSongsBody() {
    return FutureBuilder<List<SongModel>>(
        future: _allAudio.querySongs(
          sortType: SongSortType.DISPLAY_NAME,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
        ),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (item.data!.isEmpty) {
            return const Center(
                child: Text(
              "No Songs Found",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  wordSpacing: 1),
            ));
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            itemBuilder: ((context, index) {
              return SongsContainer(
                songTitle: item.data![index].displayNameWOExt,
                artistName: item.data![index].artist,
              );
            }),
            itemCount: item.data!.length,
          );
        });
  }
}
