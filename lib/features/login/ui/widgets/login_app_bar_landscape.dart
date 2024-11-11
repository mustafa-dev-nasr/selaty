import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';

import '../../../../constants/assets.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class AppBarisLandscape extends StatelessWidget {
  const AppBarisLandscape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        return isPortrait
            ? Row(
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
              )
            : Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconBar(
                        icon: Icons.camera_alt_outlined,
                      ),
                      Image.asset(
                        Assets.resourceImagesSelaty,
                        width: 80.w,
                        height: 120.h,
                      ),
                      CustomIconBar(
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
