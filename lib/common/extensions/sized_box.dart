import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension HB on num {
  SizedBox get hb {
    return SizedBox(
      height: h,
    );
  }

  SizedBox get wb {
    return SizedBox(
      width: w,
    );
  }
}
