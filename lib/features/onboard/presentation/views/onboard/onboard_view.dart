import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:easyjoob/features/onboard/presentation/views/onboard/widgets/onboard_item_widget.dart';
import 'package:easyjoob/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widgets/app_filled_button.dart';
import '../../../../../util/resource/r.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int index = 0;
  int currentPageIndex = 0;

  final pageController = PageController(
    keepPage: true,
  );

  void setPage(int value) {
    index = value;
    currentPageIndex = index;
  }

  Color getColor(int index) {
    if (index <= currentPageIndex) {
      return R.colors.blue_FF0373F3;
    } else {
      return R.colors.grey_FF7B7B7B;
    }
  }

  void animate(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              12.hb,
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (page) {
                    setState(() {
                      setPage(page);
                    });
                  },
                  children: [
                    /// [First Page]
                    OnboardItemWidget(
                      onTap: () => animate(1),
                      headingText: "Browse and Search for Jobs",
                      bodyText:
                          "Look through hundreds of job openings to find the one that's right for you.",
                      image: R.pngs.ONBOARD_IMAGE_1,
                    ),

                    /// [Second Page]
                    OnboardItemWidget(
                      onTap: () => animate(2),
                      headingText: "Explore and Search for Companies",
                      bodyText:
                          "Explore thousands of companies and established businesses.",
                      image: R.pngs.ONBOARD_IMAGE_2,
                    ),

                    /// [Third Page]
                    OnboardItemWidget(
                      onTap: () => animate(3),
                      headingText: "Stay tuned for New Opportunities",
                      bodyText:
                          "Create job alerts and stay up-to-date easily with the latest jobs and offers.",
                      image: R.pngs.ONBOARD_IMAGE_3,
                    ),

                    /// [Forth Page]
                    OnboardItemWidget(
                      onTap: () => animate(4),
                      headingText: "Manage your Profile",
                      bodyText:
                          "Customize your profile and showcase your skills and talents to the world.",
                      image: R.pngs.ONBOARD_IMAGE_4,
                    )
                  ],
                ),
              ),

              18.hb,

              /// [Indicator]
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: getColor(index),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              60.hb,

              /// [Continue Button]
              AppFilledButton(
                text: "Continue",
                onTap: () => GoRouter.of(context).push(RoutePaths.login),
              ),
              16.hb,
            ],
          ),
        ),
      ),
    );
  }
}
