import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';

class NotAuthorizedWidget extends StatelessWidget {
  const NotAuthorizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'برجاء تسجيل الدخول لتتمكن من استخدام هذه الميزة',
            textAlign: TextAlign.center,
            style: TextStyles.textStyle16,
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 200.w,
          height: 40.h,

          child: CustomButton(
            onPressed: () {
              context.go(AppRouterNames.loginScreen);
            },
            text: ' تسجيل دخول',
          ),
        ),
      ],
    );
  }
}
