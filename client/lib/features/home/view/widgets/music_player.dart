import 'package:client/config/theme/color_palette.dart';
import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongProvider);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [hexToRgb(currentSong!.hex_code), Color(0xff121212)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        backgroundColor: ColorPalette.transparentColor,
        appBar: AppBar(
          backgroundColor: ColorPalette.transparentColor,
          leading: Transform.translate(
            offset: Offset(-15, 0),
            child: InkWell(
              highlightColor: ColorPalette.transparentColor,
              focusColor: ColorPalette.transparentColor,
              splashColor: ColorPalette.transparentColor,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/down-chevron.png',
                  width: 25,
                  height: 25,
                  color: ColorPalette.whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Hero(
                  tag: 'music-image',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(currentSong!.thumbnail_url),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentSong.song_name,
                            style: TextStyle(
                              color: ColorPalette.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            currentSong.artist,
                            style: TextStyle(
                              color: ColorPalette.subtitleText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: ColorPalette.whiteColor,
                          inactiveTrackColor: ColorPalette.whiteColor
                              .withOpacity(0.1),
                          thumbColor: ColorPalette.whiteColor,
                          trackHeight: 4,
                          overlayShape: SliderComponentShape.noOverlay,
                        ),
                        child: Slider(value: 0.5, onChanged: (val) {}),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '0:00',
                        style: TextStyle(
                          color: ColorPalette.subtitleText,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        '4:00',
                        style: TextStyle(
                          color: ColorPalette.subtitleText,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/shuffle.png',
                          width: 25,
                          height: 25,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/previous.png',
                          width: 30,
                          height: 30,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.play_circle_fill,
                          color: ColorPalette.whiteColor,
                        ),
                        iconSize: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/next.png',
                          width: 30,
                          height: 30,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/repeat.png',
                          width: 25,
                          height: 25,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/devices.png',
                          width: 25,
                          height: 25,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/playlist.png',
                          width: 25,
                          height: 25,
                          color: ColorPalette.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
