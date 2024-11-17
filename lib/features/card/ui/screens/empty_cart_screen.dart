import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/widgets/app_text_button.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgrond,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: singl(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconBar(icon: Icons.camera_alt_outlined),
                    Text("عربه التسوق", style: AppTextStyles.font20BlackBold),
                    CustomIconBar(
                      icon: Icons.arrow_forward_ios_outlined,
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Image.asset(
                        Assets.resourceImagesBagIcon,
                        color: Colors.red,
                        width: 100.w,
                        height: 100.h,
                      ),
                      Text(
                        "السلة الحالية فارغة",
                        style: AppTextStyles.font24BlackSemibold,
                      ),
                      Text(
                        "أجعل سلتك سعيده وأضف منتجات",
                        style: AppTextStyles.font16BlackRegular,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 40.0.w, right: 40.0.w, bottom: 20.0.h),
                              child: AppTextButton(
                                  backgroundColor: AppColors.softGreen,
                                  onPressed: () {
                                    context
                                        .pushNamed(Routes.deliveryAddressScreen);
                                  },
                                  buttonText: "أبدأ التسوق",
                                  textStyle: AppTextStyles.font22WhiteMedium),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
        )));
  }
}
