import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/ad_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/show_all_details_section.dart';

class AdsListWidget extends StatelessWidget {
  const AdsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
          child: ShowAllDetails(details: 'المشاريع', onTap: () {}),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return AdWidget();
          },
        ),
      ],
    );
  }
}
