import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/app_shadows.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/audio_player_button.dart';

class AudioTextRecord extends StatelessWidget {
  final String text, audio;

  const AudioTextRecord({super.key, required this.text, required this.audio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 215.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: AppShadows.shadow1,
                borderRadius: BorderRadius.circular(18)),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                right: 15.w,
                left: 15.w,
              ),
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: AppTextStyle.cairoBold20black,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 15.w),
              child: AudioPlayerButton(
                width: 55,
                height: 55,
                audio: audio,
              )),
        ],
      ),
    );
  }
}
