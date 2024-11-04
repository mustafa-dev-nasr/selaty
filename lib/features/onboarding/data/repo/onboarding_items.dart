import 'package:flutter/material.dart';
import 'package:selaty/core/theming/app_colors.dart';

import '../../../../constants/assets.dart';
import '../../../../generated/l10n.dart';
import '../models/onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> getItems(BuildContext context) {
    return [
      OnboardingInfo(
        textColor: AppColors.lightRed,
        backgroundColor1: AppColors.lightRed,
        backgroundColor2: AppColors.softRed,
        backgroundColor3: AppColors.pinkishRed,
        title: S.of(context).search_nearby,
        description: S.of(context).find_favorite_stores,
        image: Assets.resourceImagesShop,
      ),
      OnboardingInfo(
          backgroundColor1: AppColors.softGreen,
          backgroundColor2: AppColors.lightGreen,
          backgroundColor3: AppColors.paleGreen,
          textColor: AppColors.softGreen,
          title: S.of(context).fresh_offers,
          description: S.of(context).all_items_have_real_freshness,
          image: Assets.resourceImagesShop),
      OnboardingInfo(
          backgroundColor2: AppColors.lightBeige,
          backgroundColor3: AppColors.veryLightGray,
          backgroundColor1: AppColors.lavender,
          textColor: AppColors.lavender,
          title: S.of(context).fast_home_delivery,
          description: S.of(context).all_items_have_real_freshness_customized,
          image: Assets.resourceImagesDelivery),
    ];
  }
}
