import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.midNight,
              size: 14.r,
            ),
            const AppSizedBox(width: 5),
            Text(
              "عودة",
              style: AppTextStyle.cairo15midNight,
            )
          ],
        ));
  }
}
