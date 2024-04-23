import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_container.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/logo.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/email.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/password_field.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          return LoadingOverlay(
            isLoading: state is SignInLoading,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                children: [
                  const AppSizedBox(height: 50),
                  const Logo(),
                  const AppSizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        "Let’s Sign You in",
                        style: AppTextStyle.cairoBold20white,
                      ),
                      const AppSizedBox(height: 10),
                      Text(
                        "Welcome back, you’ve been missed!",
                        style: AppTextStyle.cairoLight13grey,
                      ),
                    ],
                  ),
                  const AppSizedBox(height: 35),
                  AppContainer(
                    child: Column(
                      children: [
                        Email(_email),
                        const AppSizedBox(height: 10),
                        PasswordField(controller: _password),
                        const AppSizedBox(height: 40),
                        AppButton1(
                            onTap: () {
                              if(_formKey.currentState?.validate()??false) {
                                userCubit.signIn(
                                  email: _email.text, password: _password.text);
                              }
                            },
                            title: "تسجيل الدخول"),
                        const AppSizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            userCubit.resetSingUpModel();
                            Navigator.pushNamed(
                                context, RouteName.signUpScreen);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ليس لديك حساب. ",
                                style: AppTextStyle.cairoLight15black,
                              ),
                              Text(
                                "انشاء حساب",
                                style: AppTextStyle.cairoSemiBold15blue,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
