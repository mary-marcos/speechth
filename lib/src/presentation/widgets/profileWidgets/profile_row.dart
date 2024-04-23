import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class ProfileRow extends StatelessWidget {
  final String image, text;
  final GestureTapCallback? onTap;
  final bool isSvg, showDivider;

  const ProfileRow(
      {super.key,
      required this.image,
      required this.text,
      this.onTap,
      this.isSvg = true,
      this.showDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            isSvg
                ? SvgPicture.asset(
                    image,
                    height: 40.h,
                    width: 40.w,
                    fit: BoxFit.scaleDown,
                  )
                : Image.asset(
                    image,
                    height: 40.h,
                    width: 40.w,
                  ),
            const AppSizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: AppTextStyle.cairo15grey6,
              ),
            ),
          ],
        ),
        const AppSizedBox(height: 10),
      ],
    );
  }
}
