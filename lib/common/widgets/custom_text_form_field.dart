import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/resource/r.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    required this.validator,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.onSaved,
    this.onEditingComplete,
    this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.onChanged,
    this.prefixIcon,
    this.onTap,
    this.minLine = 1,
    this.maxLines = 1,
    this.radius = 56,
    this.inputFormatters,
    this.fillColor = Colors.white,
    this.textInputAction = TextInputAction.next,
    this.borderColor = Colors.black,
    this.readOnly = false,
    this.labelColor,
    this.textColor,
  });

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final bool enabled;
  final int maxLines;
  final int minLine;
  final double radius;
  final bool readOnly;
  final Color? labelColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      autofocus: autofocus,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLine,
      validator: validator,
      readOnly: readOnly,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      style: TextStyle(
        color: textColor ?? R.colors.black_FF000000,
        fontSize: 16.sp,
      ),
      cursorColor: R.colors.black_FF000000,
      cursorHeight: 20.sp,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 18.h),
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: R.colors.black_FF000000.withOpacity(0.5),
          fontSize: 16.sp,
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
        ),
        errorMaxLines: 2,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor ?? R.colors.black_FF000000,
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: fillColor,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: R.colors.black_FF000000),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: R.colors.black_FF000000),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: borderColor),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
