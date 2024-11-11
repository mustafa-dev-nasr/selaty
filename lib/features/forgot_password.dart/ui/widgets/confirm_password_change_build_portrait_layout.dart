import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/widgets/app_text_button.dart';
import '../../../../constants/assets.dart';
import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../widgets/confirm_password_change_build_landscape_layout.dart';

//ConfirmPasswordChangeBuildLandscapeLayout
class ConfirmPasswordChangeBuildPortraitLayout extends StatelessWidget {
  const ConfirmPasswordChangeBuildPortraitLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(flex: 1),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
            image: AssetImage(Assets.resourceImagesConfirmPasswordChange),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Column(
        children: [
          20.verticalSpace,
          Text(
            "تم تغيير كلمة المرور بنجاح",
            style: AppTextStyles.font24WhiteSemibold,
          ),
          20.verticalSpace,
          SizedBox(
            // height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2.5,
            child: AppTextButton(
                onPressed: () {
                      context.pushNamed(Routes.loginScreen);
                },
                buttonText: ' تم',
                textStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
                backgroundColor: white),
          ),
        ],
      ),
      const Spacer(
        flex: 2,
      ),
    ]);
  }
}
