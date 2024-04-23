import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speechth/src/config/validationform.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/fields/text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? confirmPass;
  final String? labelText;

  const PasswordField(
      {super.key, required this.controller, this.labelText, this.confirmPass});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPass = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
      obscureText: _showPass,
      textInput: TextInputType.visiblePassword,
      validator: widget.confirmPass != null
          ? (v) {
              return ValidationForm.confirmPasswordValidator(
                  widget.confirmPass?.text ?? "", v);
            }
          : ValidationForm.passwordValidator,
      fixIcon: InkWell(
        onTap: () {
          setState(() {
            _showPass = !_showPass;
          });
        },
        child: SvgPicture.asset(
          Assets.svgLock,
          fit: BoxFit.scaleDown,
          width: 23.w,
          height: 23.h,
        ),
      ),
      labelText: widget.labelText ?? 'كلمة السر',
    );
  }
}
