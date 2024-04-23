import 'package:flutter/material.dart';
import 'package:speechth/src/domain/models/sign_up_model.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/auth_back_button.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/date_of_birth.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/description.dart';

class SignUpStage3 extends StatelessWidget {
  const SignUpStage3({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit signUpCubit = UserCubit.get(context);
    final SignUpModel signUpModel = signUpCubit.signUpModel;
    return ListView(
      children: [
        DateOfBirth(
          signUpModel.date,

          labelText: "تاريخ بداية الاعراض",
        ),
        const AppSizedBox(height: 20),
        Description(signUpModel.description),
        const AppSizedBox(height: 40),
        AppButton1(
            onTap: signUpCubit.signUp,
            title: "بدء اختبار الذكاء"),
        const AppSizedBox(height: 20),
        AuthBackButton(onTap: () {
          signUpCubit.jumpToPage(1, isBack: true);
        }),

      ],
    );
  }
}
