import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/widgets/app_text_button.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                child: Image.asset(
                  Assets.resourceImagesSelaty,
                  width: 300.w,
                  height: 150.h,
                ),
              ),
              SizedBox(height: 20.h),
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
                      style: AppTextStyles.font16BlackSemibold,
                    ),
                  )),
              SizedBox(height: 20.h),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.homeScreen);
                },
                buttonText: "تسجيل الدخول",
                textStyle: AppTextStyles.font16Whiteregular,
                backgroundColor: AppColors.softGreen,
              ),
              const Spacer(),
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
                      style: AppTextStyles.font20BlackBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
