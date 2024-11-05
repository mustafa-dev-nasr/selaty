import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/theming/app_colors.dart';
import '../../../../constants/assets.dart';
import '../../../qualifiers/ui/widgets/info_card.dart';

class AdaptiveHorizontalList extends StatelessWidget {
  final int itemCount;

  const AdaptiveHorizontalList({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: isPortrait ? screenHeight / 6.5 : screenHeight / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InfoCard(
            title: 'التصفيات',
            bcImagePath: Assets.resourceImagesFruitsCategory,
            imagePath: Assets.resourceImagesCategoryIcon,
            width: isPortrait ? 100.w : MediaQuery.of(context).size.width / 2.5,
            height: isPortrait ? screenHeight / 9 : screenHeight / 4,
          );
        },
      ),
    );
  }
}
