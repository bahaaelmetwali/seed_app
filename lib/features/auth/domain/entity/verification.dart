import 'package:seed_app/features/auth/domain/entity/user.dart';

class Verification extends User {
  final int verificationCode;
  Verification(super.phone, {required this.verificationCode});
}
