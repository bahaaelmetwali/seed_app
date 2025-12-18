import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/styles.dart';

class GetAdsFailureWidget extends StatelessWidget {
  const GetAdsFailureWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding:  EdgeInsets.all(16.r),
      child: Text(errorMessage, style: TextStyles.textStyle20),
    ));
  }
}
