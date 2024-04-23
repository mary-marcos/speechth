import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speechth/src/config/validationform.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/text_form_field.dart';
import 'package:speechth/src/utils/functions/functions.dart';

class DateOfBirth extends StatefulWidget {
  final TextEditingController controller;

  final String? labelText;

  const DateOfBirth(this.controller, {Key? key, this.labelText})
      : super(key: key);

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      validator: ValidationForm.dateValidator,
      onTap: () async {
        widget.controller.text = await Functions.pickDate(context);
        setState(() {});
      },
      hintText: "DD/MM/YY",
      labelText: widget.labelText ?? 'تاريخ ميلاد الطفل',
      readOnly: true,
      fixIcon: SvgPicture.asset(
        Assets.svgCallender,
        fit: BoxFit.scaleDown,
        width: 23.w,
        height: 23.h,
      ),
    );
  }
}
