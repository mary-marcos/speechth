import 'package:flutter/material.dart';
import 'package:speechth/src/presentation/views/authScreens/login_screen.dart';
import 'package:speechth/src/presentation/views/authScreens/sign_up.dart';
import 'package:speechth/src/presentation/views/feedbackScreen/feedback_screen.dart';
import 'package:speechth/src/presentation/views/levelScreen/level_screen.dart';
import 'package:speechth/src/presentation/views/homeScreen/home_screen.dart';
import 'package:speechth/src/presentation/views/passScreen/pass_screen.dart';
import 'package:speechth/src/presentation/views/profileScreen/profile_screen.dart';
import 'package:speechth/src/presentation/views/splash.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_audio_screen.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_mcq_screen.dart';
import 'package:speechth/src/presentation/views/levelScreen/testScreens/test_rec_screen.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
        case RouteName.splash:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        case RouteName.loginScreen:
          return _animateRouteBuilder(const LoginScreen());
        case RouteName.signUpScreen:
          return _animateRouteBuilder(const SignUpScreen());
        case RouteName.homeScreen:
          return _animateRouteBuilder(const HomeScreen());
        case RouteName.testAudioScreen:
          return _animateRouteBuilder(const TestAudioScreen());
        case RouteName.testRecordScreen:
          return _animateRouteBuilder(const TestRecordScreen());
        case RouteName.testMcqScreen:
          return _animateRouteBuilder(const TestMcqScreen());
        case RouteName.levelScreen:
          return _animateRouteBuilder(const LevelScreen());
        case RouteName.profileScreen:
          return _animateRouteBuilder(const ProfileScreen());
          case RouteName.feedBackScreen:
          return _animateRouteBuilder(const FeedBackScreen());
        case RouteName.passScreen:
          return _animateRouteBuilder( PassScreen(point: args as int,),x: 0,y: 0,
              fullscreenDialog: true);

        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

  static navigateWithAnimate(context, Widget to,
          {double x = 1, double y = 0}) =>
      Navigator.push(context, _animateRouteBuilder(to, x: x, y: y));

  static _animateRouteBuilder(Widget to,
          {double x = 1, double y = 0, bool fullscreenDialog = false}) =>
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => to,
          opaque: false,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (context, animation, animationTime, child) {
            final tween = Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));
            final tween2 = Tween<double>(
              begin: 0,
              end: 1,
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation.drive(tween2),
                child: child,
              ),
            );
          });
}
