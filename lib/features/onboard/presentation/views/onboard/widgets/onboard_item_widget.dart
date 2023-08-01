import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: Column(
        children: [
          /// [Image]
          SizedBox(
            height: 286.h,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),

          75.hb,

          /// [Heading Text]
          Text(
            headingText,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: R.colors.black_FF313131,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
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
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
