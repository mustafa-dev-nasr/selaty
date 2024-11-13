import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: isPortrait ? screenHeight / 7 : screenHeight / 2.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const InfoCard(
            title: 'التصفيات',
            bcImagePath: Assets.resourceImagesFruitsCategory,
            imagePath: Assets.resourceImagesCategoryIcon,
          );
        },
      ),
    );
  }
}
