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
      return R.colors.orange_FFF98D00;
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
              120.hb,
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
                    /// [Break Languages Barrier]
                    OnboardItemWidget(
                      onTap: () => animate(1),
                      headingText: "Break Language\nBarriers",
                      bodyText:
                          "Communicate effortlessly in different\nlanguages and ensure a smooth journey.",
                      image: R.pngs.ONBOARD_IMAGE_1,
                    ),

                    /// [Second Page]
                    /// [Quick Connect with QR Code]
                    OnboardItemWidget(
                      onTap: () => animate(2),
                      headingText: "Quick Connect with\nQR Code",
                      bodyText:
                          "Save time and avoid typing errors, QR\ncode connection allows you to connect\nwith drivers or passengers instantly.",
                      image: R.pngs.ONBOARD_IMAGE_2,
                    ),

                    /// [Third Page]
                    /// [Listen to Your Messages]
                    OnboardItemWidget(
                      onTap: () => animate(3),
                      headingText: "Listen to Your\nMessages",
                      bodyText:
                          "Translates messages into speech,\nallowing you to hear and understand\nmessages in your preferred language.",
                      image: R.pngs.ONBOARD_IMAGE_3,
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
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        height: 8.h,
                        width: 12.w,
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
                onTap: () => GoRouter.of(context).push(RoutePaths.home),
              ),
              16.hb,
            ],
          ),
        ),
      ),
    );
  }
}
