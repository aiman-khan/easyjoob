import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/resource/r.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          /// [Back Icon]
          Icon(
            Icons.chevron_left,
            size: 32.r,
            weight: 2.r,
            color: color ?? R.colors.black_FF000000,
          ),

          18.wb,

          /// [Back Button]
          Text(
            "Back",
            style: TextStyle(
              fontSize: 20.sp,
              color: color ?? R.colors.black_FF000000,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
