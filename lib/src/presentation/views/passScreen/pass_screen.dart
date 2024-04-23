import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/levelWidgets/level_track.dart';

class PassScreen extends StatefulWidget {
  final int point;
  const PassScreen({super.key, required this.point});

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      _loading();
  }

  _loading() {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
            child: Column(children: [
              const LevelTrack(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+${widget.point}",
                    style: AppTextStyle.cairoMedium40green1,
                  ),
                  const AppSizedBox(width: 12),
                  Text(
                    "نقطة",
                    style: AppTextStyle.cairoMedium40grey7,
                  ),
                ],
              ),
              Image.asset(Assets.imagesStar, width: 285.w, height: 285.h,),
              const Spacer(),
            ]),
          ),
        ));
  }
}
