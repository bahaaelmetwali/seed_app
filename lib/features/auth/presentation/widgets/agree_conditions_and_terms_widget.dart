
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/auth/presentation/widgets/show_modal_button_sheet.dart';

class AgreeConditionsAndTermsWidget extends StatelessWidget {
  const AgreeConditionsAndTermsWidget({
    super.key,
    required this.isAgreed,
    this.onChanged,
    required this.onTap,
  });
  final bool isAgreed;
  final void Function(bool?)? onChanged;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.05,
          child: Checkbox(
            value: isAgreed,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            activeColor: AppColors.kPrimaryColor,

            side: BorderSide(color: Colors.black45, width: 1.5.r),
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => ShowModalButtonSheet(onTap: onTap),
            );
          },
          child: Column(
            children: [
              Text(
                'الموافقة على الشروط والأحكام',
                style: TextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Container(height: 2.h, width: 185.w, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}
