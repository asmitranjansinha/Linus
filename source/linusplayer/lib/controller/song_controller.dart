import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../notifiers/play_button_notifier.dart';
import '../notifiers/progress_notifier.dart';
import '../notifiers/repeat_button_notifer.dart';

class SongController {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  late ConcatenatingAudioSource playlist;
  late AudioPlayer audioPlayer;
  late SongModel songModel;

  void setInitialPlaylist() async {
    playlist = ConcatenatingAudioSource(
        children: [AudioSource.uri(Uri.parse(songModel.uri!))]);
    await audioPlayer.setAudioSource(playlist);
  }
}
