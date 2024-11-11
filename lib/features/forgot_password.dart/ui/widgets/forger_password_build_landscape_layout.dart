import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../../core/routing/route.dart'; // Assuming routes are defined

class ForgerPasswordBuildLandscapeLayout extends StatelessWidget {
  const ForgerPasswordBuildLandscapeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Icons and Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: Text(
                    "أدخل كلمه المرور الجديده",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: gray,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),

          // Right Side: Form for Password Reset
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextFormField(
                        hintText: "كلمة المرور الجديدة",
                        suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                        isObscureText: true, // Make password field obscure
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور الجديدة';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      AppTextFormField(
                        hintText: "تأكيد كلمة المرور",
                        suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                        isObscureText: true, // Make password field obscure
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى تأكيد كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 50.h),

                      // Button for submitting password reset
                      SizedBox(
                        width: double.infinity,
                        child: AppTextButton(
                          onPressed: () {
                            context.pushNamed(Routes.confirmPasswordChange);
                          },
                          buttonText: "تغيير",
                          textStyle: AppTextStyles.font20WhiteBold,
                          backgroundColor: AppColors.softGreen,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
