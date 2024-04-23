import 'package:flutter/material.dart';
import 'package:speechth/src/domain/models/sign_up_model.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/auth_back_button.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/date_of_birth.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/doctor_name.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/gender.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/phone_number.dart';

class SignUpStage2 extends StatelessWidget {
  const SignUpStage2({super.key});

  @override
  Widget build(BuildContext context) {
    final UserCubit signUpCubit = UserCubit.get(context);
    final SignUpModel signUpModel = signUpCubit.signUpModel;

    return Form(
      key: signUpCubit.formKeys[1],
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        children: [
          DateOfBirth(signUpModel.dateOfBirth),
          const AppSizedBox(height: 10),
          PhoneNumber(signUpModel.phone),
          const AppSizedBox(height: 10),
          Gender(value: signUpModel.gender),
          const AppSizedBox(height: 10),
          DoctorName(signUpModel.doctorName),
          const AppSizedBox(height: 40),
          AppButton1(
              onTap: () {
                signUpCubit.jumpToPage(2);
              },
              title: "التـالـي"),
          const AppSizedBox(height: 20),
          AuthBackButton(onTap: () {
            signUpCubit.jumpToPage(0, isBack: true);
          }),
        ],
      ),
    );
  }
}
