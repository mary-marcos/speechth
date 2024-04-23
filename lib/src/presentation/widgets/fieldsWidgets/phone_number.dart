import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speechth/src/config/validationform.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/text_form_field.dart';

class PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  final GestureTapCallback? onTap;

  const PhoneNumber(this.controller, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      onTap: onTap,
      hintText: "+201*********",
      validator: ValidationForm.phoneValidator,
      labelText: 'رقم هاتف للتواصل',
      textInput: TextInputType.number,
      fixIcon: SvgPicture.asset(
        Assets.svgCall,
        fit: BoxFit.scaleDown,
        width: 23.w,
        height: 23.h,
      ),
    );
  }
}
