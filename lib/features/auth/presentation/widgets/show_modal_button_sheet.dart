import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';

class ShowModalButtonSheet extends StatelessWidget {
  const ShowModalButtonSheet({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, color: Color(0xff6A6A6A)),
            ),
          ),
          Text(
            ' الموافقه علي الشروط والاحكام',
            style: TextStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى.\n'
            'إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد.\n'
            'النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص.',
            textAlign: TextAlign.center,
            style: TextStyles.textStyle14.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              onTap();
              Navigator.pop(context);
            },
            text: 'الموافقه',
          ),
        ],
      ),
    );
  }
}
