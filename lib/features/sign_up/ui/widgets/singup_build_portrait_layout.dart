import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/add_text_form_field.dart';
import '../../../../constants/assets.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class SingupBuildPortraitLayout extends StatelessWidget {
  const SingupBuildPortraitLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconBar(icon: Icons.camera_alt_outlined),
              CustomIconBar(
                icon: Icons.arrow_forward_ios_outlined,
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const ListTile(
            title: Text(
              "أنشاء حساب جديد",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "ادخل بيناتك لانشاء حساب",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            hintText: "الاسم",
            validator: (value) {},
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
          SizedBox(height: 50.h),
          AppTextButton(
            onPressed: () {},
            buttonText: "أشتراك",
            textStyle: AppTextStyles.font16Whiteregular,
            backgroundColor: AppColors.softGreen,
          ),
          SizedBox(height: 30.h),
          Center(
            child: Text(
              "أو مشترك مع",
              style: AppTextStyles.font20BlackBold,
            ),
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialContainer(
                textStyle: TextStyle(
                  color: AppColors.facebookBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                icon: Assets.resourceImagesFacebook,
                text: "Facebook",
                color: AppColors.facebookBlue,
              ),
              SizedBox(width: 20.w),
              SocialContainer(
                textStyle: TextStyle(
                  color: AppColors.coral,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: AppColors.coral,
                icon: Assets.resourceImagesGooglePlus,
                text: "Google",
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('لديك حساب بالفعل؟'),
              TextButton(
                onPressed: () {
                  context.pushNamed(Routes.loginScreen);
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
    );
  }
}

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.textStyle,
  });

  final String icon;
  final String text;
  final Color color;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: textStyle),
          SizedBox(width: 10.w),
          Image.asset(icon, width: 30.w, height: 30.h),
        ],
      ),
    );
  }
}
