import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/generated/assets.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/buttons/logout_button.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';
import 'package:speechth/src/presentation/widgets/homeWidgets/home_rows.dart';
import 'package:speechth/src/presentation/widgets/homeWidgets/user_picture.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_container.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserCubit.get(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
          buildWhen: (state1, state2) =>
              state2 is GetUserDataSuccess ||
              state2 is GetUserDataError ||
              state2 is GetUserDataLoading,
          builder: (context, state) {
            final userModel = userCubit.userModel;
            return LoadingOverlay(
              isLoading: state is GetUserDataLoading,
              child: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  children: [
                    const AppSizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const UserPicture(),
                        const AppSizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel?.childName ?? '',
                              style: AppTextStyle.cairoBold15white,
                            ),
                            Text(
                              "المستوي ${userModel?.level ?? ''}",
                              style: AppTextStyle.cairoMedium15white,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const AppSizedBox(height: 30),
                    AppContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppSizedBox(height: 20),
                          HomeRow(
                            image: Assets.svgUser,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.profileScreen);
                            },
                            text: "تفاصيل الحالة",
                          ),
                          HomeRow(
                            image: Assets.svgList,
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RouteName.levelScreen, (route) => false);
                            },
                            text: "تكملة الاختبار",
                          ),
                          const HomeRow(
                            image: Assets.imagesStar,
                            isSvg: false,
                            text: "نقاط التميز",
                          ),
                           HomeRow(
                            image: Assets.svgCall,
                            text: "اتواصل مع الدكتور",
                             onTap: (){
                                launchUrl(Uri.parse("tel:${010123456789}"),mode: LaunchMode.externalApplication);
                             },
                          ),
                          HomeRow(
                            image: Assets.svgList,
                            text: "FeedBack",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.feedBackScreen);
                            },
                            showDivider: false,
                          ),

                          const LogoutButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
