import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/onboarding_info.dart';
import '../../data/repo/onboarding_items.dart';
import '../../logic/onboarding_helpers.dart';
import '../widgets/onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;
  bool _isFirstPage = false;

  @override
  Widget build(BuildContext context) {
    final onboardingItems = OnboardingItems();
    final List<OnboardingInfo> items = onboardingItems.getItems(context);
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          reverse: isArabic,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) => _updateIsLastPage(index, items.length),
          itemCount: items.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return _buildPageContent(context, items, index);
          },
        ),
      ),
    );
  }

  Widget _buildPageContent(
      BuildContext context, List<OnboardingInfo> items, int index) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.resourceImagesBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildSkipButton(items.length),
                  ],
                ),
                OnboardingContent(
                  item: items[index],
                  pageController: _pageController,
                ),
                SizedBox(height: 100.h),
                _buildBottomControls(context, items.length),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkipButton(int totalItems) {
    return _isFirstPage
        ? const SizedBox()
        : Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => skipToLastPage(_pageController, totalItems),
              child: Text(
                S.of(context).Skip,
                style: AppTextStyles.font24BlueMedium,
              ),
            ),
          );
  }

  Widget _buildBottomControls(BuildContext context, int totalItems) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: _pageController,
          count: totalItems,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.lightRed,
            dotColor: gray,
            dotHeight: 10.h,
            dotWidth: 20.w,
            expansionFactor: 2.5.w,
            spacing: 5.0.w,
          ),
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        ),
        _buildNextButton(context),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return _isLastPage
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.lightRed,
              shape: const CircleBorder(),
            ),
            onPressed: () => context.pushNamed(Routes.mainAuth),
            child: const Icon(Icons.arrow_back, color: white),
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.lightRed,
              shape: const CircleBorder(),
            ),
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            ),
            child: const Icon(Icons.arrow_back, color: white),
          );
  }

  void _updateIsLastPage(int currentPage, int totalPages) {
    setState(() {
      _isLastPage = currentPage == totalPages - 1;
      _isFirstPage = currentPage == 2;
    });
  }
}
