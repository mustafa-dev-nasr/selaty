import 'package:flutter/material.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/features/splach/ui/screens/splash_screen.dart';
import '../../features/card/ui/screens/card_screen.dart';
import '../../features/card/ui/screens/empty_cart_screen.dart';
import '../../features/categories_details.dart/ui/screens/categories_details_screen.dart';
import '../../features/delivery_address/ui/screens/arrange_tracks.dart';
import '../../features/delivery_address/ui/screens/delivery_address_screen.dart';
import '../../features/forgot_password.dart/ui/screens/confirm_password_change.dart';
import '../../features/forgot_password.dart/ui/screens/forgot_password_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/sign_up/ui/screens/sign_up.dart';
import '../../features/sign_up/ui/screens/main_auth.dart';
import '../../features/onboarding/ui/screens/on_boarding_screens.dart';
import '../../features/profile/ui/screens/profile_screen.dart';
import '../../features/qualifiers/ui/screens/qualifiers_screen.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../../features/successful_request/ui/screens/successful_request.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.mainAuth:
        return MaterialPageRoute(builder: (_) => const MainAuth());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
        case Routes.confirmPasswordChange:  return MaterialPageRoute(builder: (_) => const ConfirmPasswordChange());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.qualifiers:
        return MaterialPageRoute(builder: (_) => const QualifiersScreen());
      case Routes.categoriesDetails:
        return MaterialPageRoute(
            builder: (_) => const CategoriesDetailsScreen());
      case Routes.cardScreen:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      case Routes.emptyCartScreen:
        return MaterialPageRoute(builder: (_) => const EmptyCartScreen());
      case Routes.deliveryAddressScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryAddressScreen());
      case Routes.successfulRequest:
        return MaterialPageRoute(builder: (_) => const SuccessfulRequest());
      case Routes.arrangeTracks:
        return MaterialPageRoute(builder: (_) => const ArrangeTracks());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Unknown route")),
          ),
        );
    }
  }
}
