import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linusplayer/controller/song_controller.dart';
import 'package:linusplayer/views/base/mini_player.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'favourite_database.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  static ConcatenatingAudioSource createSongList(List<SongModel> song) {
    List<AudioSource> source = [];
    for (var songs in song) {
      source.add(AudioSource.uri(Uri.parse(songs.uri!)));
    }
    return ConcatenatingAudioSource(children: source);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FavaroiteDb.favaroiteList,
      builder: (BuildContext context, List<SongModel> favaorSong, Widget? _) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
            child: Scaffold(
              bottomNavigationBar: BottomMusicContainer(),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text("Your Favourites ❥",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              body: FavaroiteDb.favaroiteList.value.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.1),
                      child: const Center(
                        child: Text(
                          "No Songs in the Favourite",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  : ListView(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: FavaroiteDb.favaroiteList,
                          builder: (BuildContext context,
                              List<SongModel> favorSong, Widget? child) {
                            SongController.playingSongs = favaorSong;
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: favaorSong.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  color: Colors.white,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  onTap: () {
                                    List<SongModel> newList = [...favaorSong];
                                    // setState(() {});
                                    SongController.player.stop();
                                    SongController.player.setAudioSource(
                                        createSongList(newList),
                                        initialIndex: index);
                                    SongController.player.play();
                                  },
                                  leading: QueryArtworkWidget(
                                    id: favaorSong[index].id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: const Icon(
                                      Icons.music_note_outlined,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  title: Text(
                                    favaorSong[index].displayNameWOExt,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    favaorSong[index].artist!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    iconSize: 1,
                                    icon: Lottie.asset(
                                        'assets/images/likebutton.json'),
                                    onPressed: () {
                                      FavaroiteDb.removeSong(
                                          favaorSong[index].id);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
            ));
      },
    );
  }
}
