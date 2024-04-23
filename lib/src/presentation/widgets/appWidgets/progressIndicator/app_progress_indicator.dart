import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:speechth/src/config/style/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  final double percent;
  const AppProgressIndicator({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 15.h,
      isRTL: true,
      barRadius: const Radius.circular(18),
      percent: percent,
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: AppColors.white2,
      progressColor: AppColors.green1,
    );
  }
}
