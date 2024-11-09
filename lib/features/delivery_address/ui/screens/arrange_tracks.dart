import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_icon_bar.dart';
import '../widgets/order_step.dart';

class ArrangeTracks extends StatefulWidget {
  const ArrangeTracks({super.key});

  @override
  _ArrangeTracksState createState() => _ArrangeTracksState();
}

class _ArrangeTracksState extends State<ArrangeTracks> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              // Header with icons and title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBar(icon: Icons.camera_alt_outlined),
                  Text("ترتيب المسار", style: AppTextStyles.font20BlackBold),
                  CustomIconBar(
                    icon: Icons.arrow_forward_ios_outlined,
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Order Info Container
              Container(
                height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.softGreen,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'معرف الطلب: OD2204#',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'تاريخ النشر 26 كانون الثاني (يناير) 2021',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 12.sp),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'البنود: 15   الاجمالي: 100 ريال',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.local_cafe,
                          color: Colors.purple, size: 30.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Order Steps Card
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: ListView(
                      children: [
                        OrderStep(
                          title: 'تم الطلب',
                          date: '9 نوفمبر 2024',
                          isActive: activeStep >= 0,
                          onTap: () => setState(() => activeStep = 0),
                        ),
                        OrderStep(
                          title: 'Order',
                          date: '9 نوفمبر 2024',
                          isActive: activeStep >= 1,
                          onTap: () => setState(() => activeStep = 1),
                        ),
                        OrderStep(
                          title: 'تم شحن الطلب',
                          date: '9 نوفمبر 2024',
                          isActive: activeStep >= 2,
                          onTap: () => setState(() => activeStep = 2),
                        ),
                        OrderStep(
                          title: 'خارج الخدمة',
                          subtitle: 'قيد الانتظار',
                          date: '9 نوفمبر 2024',
                          isActive: activeStep >= 3,
                          onTap: () => setState(() => activeStep = 3),
                        ),
                        OrderStep(
                          title: 'اجل تسليم',
                          subtitle: 'قيد الانتظار',
                          date: '9 نوفمبر 2024',
                          isActive: activeStep >= 4,
                          isLastStep: true,
                          onTap: () => setState(() => activeStep = 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
