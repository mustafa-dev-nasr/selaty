import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import '../widgets/info_card.dart';
import '../../../../constants/assets.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class QualifiersScreen extends StatelessWidget {
  const QualifiersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBar(icon: Icons.camera_alt_outlined),
                  Text(
                    "التصنيفات",
                    style: AppTextStyles.font20BlackBold,
                  ),
                  CustomIconBar(
                    icon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
              20.verticalSpace,
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items in each row
                    crossAxisSpacing: 10.w, // Space between items horizontally
                    mainAxisSpacing: 10.h, // Space between items vertically
                    childAspectRatio: (screenWidth / 2) /
                        (screenHeight / 4), // Adjust as necessary
                  ),
                  itemCount: 10, // Replace with dynamic item count if needed
                  itemBuilder: (context, index) {
                    return InfoCard(
                      title: 'التصفيات',
                      imagePath: Assets.resourceImagesFruitsCategory,
                      width: isPortrait
                          ? 200.w
                          : MediaQuery.of(context).size.width / 2.5,
                      height: isPortrait ? screenHeight / 8 : screenHeight / 4,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
