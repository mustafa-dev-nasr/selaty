import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/features/onboarding/ui/widgets/onboarding_content.dart';
import 'package:selaty/features/onboarding/ui/widgets/onboarding_content_build_landscape_layout.dart';
import 'package:selaty/features/sign_up/ui/widgets/singup_build_landscape_layout.dart';
import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../constants/assets.dart';
import '../../../../core/widgets/custom_icon_bar.dart';
import '../widgets/on_boarding_screen_build_landscape_layout.dart';
import '../widgets/on_boarding_screen_build_portrait_layout.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const OnBoardingScreenBuildPortraitLayout();
            } else {
              return const OnBoardingScreenBuildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}
