import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:selaty/generated/l10n.dart';
import 'core/routing/app_router.dart';
import 'core/routing/route.dart';
import 'core/theming/app_colors.dart';
import 'features/home/ui/screens/home_screen.dart';

class SelatyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isLoggedIn;

  const SelatyApp({
    super.key,
    required this.appRouter,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: blue,
            scaffoldBackgroundColor: white,
          ),
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          title: 'Radary',
          home: const HomeScreen(),
          // initialRoute:
          //     isLoggedIn ? Routes.homeScreen : Routes.onBoardingScreen,
        );
      },
    );
  }
}