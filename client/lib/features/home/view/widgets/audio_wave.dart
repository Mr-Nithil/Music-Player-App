import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:client/config/theme/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioWave extends StatefulWidget {
  final String path;
  const AudioWave({super.key, required this.path});

  @override
  State<AudioWave> createState() => _AudioWaveState();
}

class _AudioWaveState extends State<AudioWave> {
  final PlayerController playerController = PlayerController();

  @override
  void initState() {
    initAudioPlayer();
    super.initState();
  }

  void initAudioPlayer() async {
    await playerController.preparePlayer(path: widget.path);
  }

  Future<void> playAndPause() async {
    if (!playerController.playerState.isPlaying) {
      await playerController.setFinishMode(finishMode: FinishMode.stop);
      await playerController.startPlayer();
    } else if (!playerController.playerState.isPaused) {
      await playerController.pausePlayer();
    }
    setState(() {});
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: playAndPause,
          icon: playerController.playerState.isPlaying
              ? Icon(CupertinoIcons.pause_solid)
              : Icon(CupertinoIcons.play_arrow_solid),
        ),
        Expanded(
          child: AudioFileWaveforms(
            size: Size(double.infinity, 80),
            playerController: playerController,
            playerWaveStyle: PlayerWaveStyle(
              fixedWaveColor: ColorPalette.borderColor,
              liveWaveColor: ColorPalette.gradient2,
              spacing: 6,
              showSeekLine: false,
            ),
          ),
        ),
      ],
    );
  }
}
