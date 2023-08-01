import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/resource/r.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(R.colors.white_FFFFFFFF),
        side: MaterialStateProperty.all(
          BorderSide(
            color: R.colors.orange_FFFE4B10,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width ?? 327.w, 48.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.r),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: R.colors.orange_FFFE4B10,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
