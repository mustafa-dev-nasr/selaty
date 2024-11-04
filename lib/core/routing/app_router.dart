import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/routing/route.dart';
import '../../features/categories_details.dart/ui/screens/categories_details_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../../features/login/ui/screens/main_auth.dart';
import '../../features/onboarding/ui/screens/on_boarding_screens.dart';
import '../../features/profile/ui/screens/profile_screen.dart';
import '../../features/qualifiers/ui/screens/qualifiers_screen.dart';
import '../../features/sign_up/ui/screens/sign_up_screen.dart';
import '../di/dependecy_injection.dart';
import '../widgets/animated_splash_screen_custom.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const AnimatedSplashScreenCustom());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.mainAuth:
        return MaterialPageRoute(builder: (_) => const MainAuth());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.qualifiers:
        return MaterialPageRoute(builder: (_) => const QualifiersScreen());
        case Routes.categoriesDetails:
        return MaterialPageRoute(builder: (_) => const CategoriesDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Unknown route")),
          ),
        );
    }
  }
}
