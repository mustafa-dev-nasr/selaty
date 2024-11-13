import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/onboarding_info.dart';
import '../../data/repo/onboarding_items.dart';
import '../widgets/onboarding_content.dart';

//OnBoardingScreenBuildPortraitLayout
class OnBoardingScreenBuildPortraitLayout extends StatefulWidget {
  const OnBoardingScreenBuildPortraitLayout({super.key});

  @override
  OnBoardingScreenBuildPortraitLayoutState createState() =>
      OnBoardingScreenBuildPortraitLayoutState();
}

class OnBoardingScreenBuildPortraitLayoutState
    extends State<OnBoardingScreenBuildPortraitLayout> {
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

  // Build content for each page of the onboarding process
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     _buildSkipButton(items.length),
                //   ],
                // ),
                OnboardingContentBuildPrtrait(
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

  // // Skip button to skip onboarding steps
  // Widget _buildSkipButton(int totalItems) {
  //   return !_isFirstPage
  //       ? Align(
  //           alignment: Alignment.topRight,
  //           child: TextButton(
  //             onPressed: () => skipToLastPage(_pageController, totalItems),
  //             child: Text(
  //               S.of(context).Skip,
  //               style: AppTextStyles.font24BlueMedium,
  //             ),
  //           ),
  //         )
  //       : const SizedBox();
  // }

  Widget _buildBottomControls(BuildContext context, int totalItems) {
    // Function to get active dot color based on the current page index
    Color getActiveDotColor(int currentPage) {
      switch (currentPage) {
        case 0:
          return AppColors.lightRed;
        case 1:
          return AppColors.softGreen;
        case 2:
          return AppColors.lavender;
        default:
          return AppColors.lightRed;
      }
    }

    // Wait for the page to be built before accessing `pageController.page`
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.page != null) {
        setState(() {
          _isLastPage = _pageController.page!.toInt() == totalItems - 1;
          _isFirstPage = _pageController.page!.toInt() == 0;
        });
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: _pageController,
          count: totalItems,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 8.w,
              height: 20.h,
              color: getActiveDotColor(_pageController.page?.toInt() ?? 0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            dotDecoration: DotDecoration(
              width: 8.h,
              height: 8.h,
              color: gray,
              borderRadius: BorderRadius.circular(8.0),
            ),
            spacing: 5.0.w,
          ),
          textDirection: TextDirection.ltr,
        ),
        _buildNextButton(context),
      ],
    );
  }

  // Next button to navigate to the next page or complete onboarding
  Widget _buildNextButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.lightRed,
        shape: const CircleBorder(),
      ),
      onPressed: () => _isLastPage
          ? context
              .pushNamed(Routes.mainAuth) // Navigate to main auth on last page
          : _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            ),
      child: Icon(
        _isLastPage ? Icons.done : Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  // Update the state for the first and last page
  void _updateIsLastPage(int currentPage, int totalPages) {
    setState(() {
      _isLastPage = currentPage == totalPages - 1;
      _isFirstPage = currentPage == 0;
    });
  }
}
