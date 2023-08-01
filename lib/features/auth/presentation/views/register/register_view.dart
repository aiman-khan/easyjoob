import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/resource/r.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey_FFD9D9D9,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Stack(
                  children: [
                    /// [Back]
                    Row(
                      children: [
                        /// [Back Icon]
                        Icon(
                          Icons.chevron_left,
                          size: 32.r,
                          weight: 2.r,
                        ),

                        18.wb,

                        /// [Back Button]
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: R.colors.black_FF0B0B0B,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    /// [Logo]
                    Image.asset(R.pngs.REGISTER_LOGO)
                  ],
                ),
              ),

              /// [Body]
              SizedBox(
                height: 800.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
