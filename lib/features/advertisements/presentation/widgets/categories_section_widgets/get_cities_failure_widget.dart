import 'package:flutter/material.dart';
import 'package:seed_app/core/utils/constants/styles.dart';

class GetCitiesFailure extends StatelessWidget {
  const GetCitiesFailure({
    super.key, required this.errorMessage,
  });
final String errorMessage ;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyles.textStyle20,
    );
  }
}
