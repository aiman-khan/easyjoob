import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/resource/r.dart';

class AppDropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final void Function(T?) onChanged;
  final String? hintText;
  final T? selectedItem;

  const AppDropdownWidget({
    super.key,
    required this.items,
    this.selectedItem,
    required this.itemBuilder,
    required this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.h),
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56.r),
        border: Border.all(color: R.colors.black_FF000000),
      ),
      child: DropdownButton<T>(
        value: selectedItem,
        underline: const SizedBox(),
        hint: Text(
          hintText ?? "Select",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        borderRadius: BorderRadius.circular(15.0),
        isExpanded: true,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemBuilder(item),
          );
        }).toList(),
      ),
    );
  }
}
