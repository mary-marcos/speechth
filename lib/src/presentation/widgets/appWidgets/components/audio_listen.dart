import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class AudioListen extends StatefulWidget {
  final String audio;

  const AudioListen({super.key, required this.audio});

  @override
  State<AudioListen> createState() => _AudioListenState();
}

class _AudioListenState extends State<AudioListen> {
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
    return AppSizedBox(
      height: 275,
      width: 275,
      child: InkWell(
          onTap: () {
            if (_player.playing) {
              _player.seek(const Duration(seconds: 0));
            } else {
              _player.play();
            }
          },
          child: Image.asset(Assets.imagesAudio)),
    );
  }
}
