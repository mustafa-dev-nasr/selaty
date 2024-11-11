import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/features/forgot_password.dart/ui/widgets/forger_password_build_landscape_layout.dart';
import 'package:selaty/features/forgot_password.dart/ui/widgets/forger_password_build_portrait_layout.dart';
import '../../../../constants/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../../generated/l10n.dart'; // Import for localization (if needed)
import '../../../../core/routing/route.dart';
import '../../../sign_up/ui/widgets/singup_build_landscape_layout.dart'; // Assuming routes are defined

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const ForgerPasswordBuildPortraitLayout();
            } else {
              return const ForgerPasswordBuildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}
//