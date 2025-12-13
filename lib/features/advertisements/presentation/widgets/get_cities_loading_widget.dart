import 'package:flutter/material.dart';
import 'package:seed_app/core/widgets/custom_loading_shimmer.dart';

class GetCitiesLoadingWidget extends StatelessWidget {
  const GetCitiesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CustomLoadingShimmer(height: 50, width: 78);
      },
    );
  }
}
