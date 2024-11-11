import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/widgets/app_text_button.dart';
import '../../../../constants/assets.dart';
import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../widgets/confirm_password_change_build_landscape_layout.dart';
import '../widgets/confirm_password_change_build_portrait_layout.dart';

class ConfirmPasswordChange extends StatelessWidget {
  const ConfirmPasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGreen,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const ConfirmPasswordChangeBuildPortraitLayout();
            } else {
              return const ConfirmPasswordChangeBuildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}
