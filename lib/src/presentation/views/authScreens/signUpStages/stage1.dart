import 'package:flutter/material.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/domain/models/sign_up_model.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/child_name.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/email.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/password_field.dart';

class SignUpStage1 extends StatelessWidget {
  const SignUpStage1({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit signUpCubit = UserCubit.get(context);
    final SignUpModel signUpModel = signUpCubit.signUpModel;
    return Form(
      key: signUpCubit.formKeys[0],
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          ChildName(signUpModel.childName),
          const AppSizedBox(height: 10),
          Email(signUpModel.email),
          const AppSizedBox(height: 10),
          PasswordField(controller: signUpModel.password),
          const AppSizedBox(height: 10),
          PasswordField(
            controller: signUpModel.confirmPassword,
            confirmPass: signUpModel.password,
            labelText: "كرر كلمة السر",
          ),
          const AppSizedBox(height: 40),
          AppButton1(
              onTap: () {
                signUpCubit.jumpToPage(1);
              },
              title: "التـالـي"),
          const AppSizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "امتلك حساب بالفعل. ",
                  style: AppTextStyle.cairoLight15black,
                ),
                Text(
                  "تسجيل الدخول",
                  style: AppTextStyle.cairoSemiBold15blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
