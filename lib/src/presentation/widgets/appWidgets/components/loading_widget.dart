import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/text_styles.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/app_sized_box.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(
                size: 120,
                itemBuilder: (BuildContext context, int index) {
                  return const DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle
                    ),
                  );
                },
              ),
              const AppSizedBox(height: 30),
              Text("انتظر قليلاً",
                  style: AppTextStyle.cairoMedium28black),
              Text("We are working task",
                  style: AppTextStyle.cairo14grey4),
            ],
          ),
        ),
      ),
    );
  }
}
