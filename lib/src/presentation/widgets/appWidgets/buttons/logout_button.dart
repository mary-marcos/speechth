import 'package:flutter/material.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppSizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(

          onPressed: () {
            UserCubit.get(context).logout();
          },
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0.0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
            backgroundColor: const MaterialStatePropertyAll(AppColors.error3),
          ),
          child: Text(
            "خروج",
            style: AppTextStyle.cairo15red,
          )),
    );
  }
}
