import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/text_field.dart';

class Description extends StatelessWidget {
  final TextEditingController controller;

  const Description(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text("وصف الحالة و الاعراض",style:AppTextStyle.cairoLight15black,),
          const Spacer(),
          SvgPicture.asset(
            Assets.svgList,
            fit: BoxFit.scaleDown,
            width: 23.w,
            height: 23.h,
          ),
          const AppSizedBox(width: 13),
        ],),
        AppSizedBox(height: 100,
          child: AppTextField(
            controller: controller,
            hintText: 'اكتب وصف الحالة من اعراض و فترات تكرارها...',
          ),
        ),
      ],
    );
  }
}
