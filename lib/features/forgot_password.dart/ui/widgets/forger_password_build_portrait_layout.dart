import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import '../../../../constants/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../../generated/l10n.dart'; // Import for localization (if needed)
import '../../../../core/routing/route.dart'; // Assuming routes are defined

class ForgerPasswordBuildPortraitLayout extends StatelessWidget {
  const ForgerPasswordBuildPortraitLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconBar(
                  icon: Icons.camera_alt_outlined,
                  onPressed: () {
                    // Handle camera icon press
                  },
                ),
                CustomIconBar(
                  icon: Icons.arrow_forward_ios_outlined,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أدخل كلمه المرور الجديده",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: gray),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Form(
              child: Column(
                children: [
                  AppTextFormField(
                    hintText: " كلمة المرور الجديده",
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                    isObscureText: true, // Make password field obscure
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال بريدك الإلكتروني';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                          .hasMatch(value)) {
                        return 'يرجى إدخال بريد إلكتروني صالح';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    hintText: " كلمة المرور الجديده",
                    suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                    isObscureText: true, // Make password field obscure
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
    
                  // Use SizedBox.expand() to make the button take the full width
                  SizedBox(
                    width: double.infinity,
                    child: AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.confirmPasswordChange);
                      },
                      buttonText: "تغير",
                      textStyle: AppTextStyles.font20WhiteBold,
                      backgroundColor: AppColors.softGreen,
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Add space to avoid layout issues
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
