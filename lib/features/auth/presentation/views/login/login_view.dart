import 'package:easyjoob/common/extensions/sized_box.dart';
import 'package:easyjoob/common/widgets/custom_text_form_field.dart';
import 'package:easyjoob/features/onboard/presentation/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  LogoTextWidget(),
                  SizedBox(width: 32.w),
                ],
              ),
              44.hb,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                    12.hb,
                    Text(
                      "Login and explore new vacancies",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    24.hb,
                    CustomTextFormField(
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      radius: 6.r,
                      hintText: "Enter your email address",
                      fillColor: Colors.blueGrey.withOpacity(0.001),
                      borderColor: Colors.blueGrey.withOpacity(0.4),
                      validator: (v) {},
                    ),
                    12.hb,
                    CustomTextFormField(
                      labelText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      radius: 6.r,
                      hintText: "Enter your password",
                      fillColor: Colors.blueGrey.withOpacity(0.001),
                      borderColor: Colors.blueGrey.withOpacity(0.4),
                      validator: (v) {},
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
