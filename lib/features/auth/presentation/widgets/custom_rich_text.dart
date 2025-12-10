
import 'package:flutter/material.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.minutes,
    required this.remainingSecond,
    required this.phoneNumber,
  });
  final String phoneNumber;

  final int minutes;
  final String remainingSecond;
  String last3Digits(String phone) {
    if (phone.length <= 3) return phone;
    return phone.substring(phone.length - 3);
  }

  @override
  Widget build(BuildContext context) {
    final last3Numbers = last3Digits(phoneNumber);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                "لتأكيد حسابك قم بادخال الكود المكون من 4 ارقام الذي تم ارساله في رساله الي رقم الهاتف $last3Numbers --- --- ---",
            style: TextStyles.textStyle18.copyWith(color: Color(0xff6A6A6A)),
          ),
          TextSpan(
            text: "(تغيير الرقم)",
            style: TextStyles.textStyle18.copyWith(
              color: Constants.kPrimaryColor,
            ),
          ),
          TextSpan(
            text: ", ٍسيصلك الكود خلال ",
            style: TextStyles.textStyle18.copyWith(color: Color(0xff6A6A6A)),
          ),
          TextSpan(
            text: '0$minutes:$remainingSecond',
            style: TextStyles.textStyle18.copyWith(
              color: Constants.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
