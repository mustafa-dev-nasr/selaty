import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import '../../../../constants/assets.dart';
import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class ConfirmPasswordChangeBuildLandscapeLayout extends StatelessWidget {
  const ConfirmPasswordChangeBuildLandscapeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          // Left Side: Confirmation Image
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.w), // Smaller padding for flexibility
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage(Assets.resourceImagesConfirmPasswordChange),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),

          // Right Side: Success Message and "Done" Button
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "تم تغيير كلمة المرور بنجاح",
                  style: AppTextStyles.font24WhiteSemibold,
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 50.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: AppTextButton(
                    onPressed: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    buttonText: 'تم',
                    textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
