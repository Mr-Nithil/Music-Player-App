import 'package:client/features/home/model/song_model.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier {
  AudioPlayer? audioPlayer;
  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  @override
  SongModel? build() {
    ref.onDispose(() {
      audioPlayer?.dispose();
      isPlayingNotifier.dispose();
    });

    return null;
  }

  void updateSong(SongModel song) async {
    await audioPlayer?.dispose();
    audioPlayer = AudioPlayer();

    final audioSource = AudioSource.uri(Uri.parse(song.song_url));

    await audioPlayer!.setAudioSource(audioSource);

    audioPlayer!.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        audioPlayer!.seek(Duration.zero);
        audioPlayer!.pause();
        isPlayingNotifier.value = false;
      }
    });

    audioPlayer!.play();
    isPlayingNotifier.value = true;
    state = song;
  }

  void playPause() {
    final isPlaying = isPlayingNotifier.value;

    if (isPlaying) {
      audioPlayer?.pause();
    } else {
      audioPlayer?.play();
    }

    isPlayingNotifier.value = !isPlaying;
  }

  void seek(double val) {
    audioPlayer!.seek(
      Duration(
        milliseconds: (val * audioPlayer!.duration!.inMilliseconds).toInt(),
      ),
    );
  }
}
