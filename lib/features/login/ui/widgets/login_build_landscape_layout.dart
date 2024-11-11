import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/widgets/app_text_button.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import 'login_app_bar_landscape.dart';

class LoginBuildLandscapeLayout extends StatelessWidget {
  const LoginBuildLandscapeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Row(
          children: [
            // Left side: Image and App Bar
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const AppBarisLandscape(),
                  SizedBox(height: 40.h),
                  SizedBox(height: 20.h),
                  AppTextButton(
                    onPressed: () {
                      context.pushNamed(Routes.homeScreen);
                    },
                    buttonText: "تسجيل الدخول",
                    buttonHeight: 110.h,
                    textStyle: TextStyle(color: white, fontSize: 16.sp),
                    backgroundColor: AppColors.softGreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('لديك حساب بالفعل؟'),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.signUpScreen);
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: AppTextStyles.font12BlackRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 20.w),

            // Right side: Form and Actions
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextFormField(
                      hintText: "عنوان البريد الإلكتروني",
                      suffixIcon: const Icon(
                        Icons.download_done_sharp,
                        color: AppColors.softGreen,
                      ),
                      validator: (value) {},
                    ),
                    SizedBox(height: 20.h),
                    AppTextFormField(
                      hintText: "كلمة المرور",
                      suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                      validator: (value) {},
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.forgotPassword);
                        },
                        child: Text(
                          "هل نسيت كلمة السر؟",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font12BlackRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
