import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:speechth/src/blocobserve.dart';
import 'package:speechth/src/config/router/router.dart';
import 'package:speechth/src/config/style/app_colors.dart';
import 'package:speechth/src/config/style/themes.dart';
import 'package:speechth/src/data/local/cache_helper.dart';
import 'package:speechth/src/domain/repositries/user_repo.dart';
import 'package:speechth/src/locator.dart';
import 'package:speechth/src/presentation/cubits/main_cubit/cubit.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/views/splash.dart';
import 'package:speechth/src/utils/variables/routerkeys.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainCubit()),
        BlocProvider(create: (_) => UserCubit((sl<UserRepo>()))),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return OKToast(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Themes.defaultTheme,
              color: AppColors.blue,
              title: 'Speech',
              home: const SplashScreen(),
              onGenerateRoute: RouterApp.generateRoute,
              navigatorKey: RouterKeys.mainNavigatorKey,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('ar', ''), Locale('en', '')],
              locale: const Locale('ar'),
            ),
          );
        },
      ),
    );
  }
}
