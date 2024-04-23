import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/cubit.dart';

class AudioPlayerButton extends StatefulWidget {
  final String audio;
  final double? height, width;

  const AudioPlayerButton(
      {super.key, this.height, this.width, required this.audio});

  @override
  State<AudioPlayerButton> createState() => _AudioPlayerButtonState();
}

class _AudioPlayerButtonState extends State<AudioPlayerButton> {
  final _player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAudio();
  }

  _loadAudio() async {
    await _player.setAsset(widget.audio);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TestCubit.get(context).resetText();
        if (_player.playing) {
          _player.seek(const Duration(seconds: 0));
        } else {
          _player.play();
        }
      },
      child: Image.asset(
        Assets.imagesAudio1,
        width: widget.width?.w,
        height: widget.height?.h,
      ),
    );
  }
}
