import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class RecordItem extends StatelessWidget {
  final GestureTapCallback? onTap;

  const RecordItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: onTap,
            child: Image.asset(Assets.imagesMic, width: 92.w, height: 92.h)),
        const AppSizedBox(height: 10),
        Text(
          "دوس هنا .... و كرر اللي سمعته",
          style: AppTextStyle.cairoBold20white,
        )
      ],
    );
  }
}
