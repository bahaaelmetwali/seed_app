import 'package:flutter/material.dart';
import 'package:seed_app/core/utils/styles.dart';

class GetAdsFailureWidget extends StatelessWidget {
  const GetAdsFailureWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage, style: TextStyles.textStyle20));
  }
}
