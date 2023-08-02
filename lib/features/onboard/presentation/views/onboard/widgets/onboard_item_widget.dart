import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:easyjoob/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../util/resource/r.dart';

class OnboardItemWidget extends StatelessWidget {
  const OnboardItemWidget({
    super.key,
    required this.onTap,
    required this.headingText,
    required this.bodyText,
    required this.image,
  });

  final VoidCallback onTap;
  final String headingText;
  final String bodyText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.hb,

            /// [Image]
            Center(
              child: Container(
                color: R.colors.orange_FFFE4B10.withOpacity(0.1),
                padding: EdgeInsets.all(14.r),
                child: Column(
                  children: [
                    /// [Skip]
                    GestureDetector(
                      onTap: () => GoRouter.of(context).push(RoutePaths.home),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 55.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: R.colors.blue_FF0373F3,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: R.colors.white_FFFFFFFF,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            45.hb,

            /// [Heading Text]
            Text(
              headingText,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: R.colors.black_FF313131,
                height: 1.5,
              ),
            ),

            12.hb,

            /// [Body Text]
            Text(
              bodyText,
              style: TextStyle(
                fontSize: 16.sp,
                color: R.colors.grey_FF7B7B7B,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
