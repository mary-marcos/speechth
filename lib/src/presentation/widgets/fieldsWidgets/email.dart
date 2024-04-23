import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/config/validationform.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/text_form_field.dart';

class Email extends StatelessWidget {
  final TextEditingController controller;

  const Email(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      textInput: TextInputType.emailAddress,
      labelText: 'البريد الالكتروني للمرافق',
      validator: ValidationForm.emailValidator,
      fixIcon: SvgPicture.asset(Assets.svgMail,
          fit: BoxFit.scaleDown, width: 23.w, height: 23.h),
    );
  }
}
