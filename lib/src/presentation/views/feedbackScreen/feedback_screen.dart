import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/app_shadows.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/back_button.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/button1.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/toasters.dart';
import 'package:speechth/src/presentation/widgets/fieldsWidgets/feed_back.dart';
import 'package:speechth/src/presentation/widgets/homeWidgets/user_picture.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<UserCubit, UserState>(
          buildWhen: (state, state2) =>
              state2 is SendFeedBackLoading ||
              state2 is SendFeedBackSuccess ||
              state2 is SendFeedBackError,
          builder: (context, state) {
            return LoadingOverlay(
              isLoading: state is SendFeedBackLoading,
              child: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  children: [
                    const AppSizedBox(height: 40),
                    const AppBackButton(),
                    const AppSizedBox(height: 60),
                    Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: AppShadows.shadow1,
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              const AppSizedBox(height: 50),
                              FeedBackField(_message)
                            ],
                          ),
                        ),
                        const Positioned(top: -50, child: UserPicture())
                      ],
                    ),
                    const AppSizedBox(height: 20),
                    AppButton1(
                      title: "ارسال",
                      onTap: () {
                        if (_message.text.isEmpty) {
                          Toasters.show("برجاء كتابة رساله");
                        } else {
                          userCubit.sendFeedBack(_message.text);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
