import 'package:seed_app/features/auth/domain/entity/register_request.dart';

class SendRegisterRequestModel extends RegisterRequest {
  SendRegisterRequestModel({
    required super.mobile,
    required super.email,
    required super.name,
  });
  Map<String, dynamic> toJson() => {
    'mobile': mobile,
    'name': name,
    'email': email,
  };
  factory SendRegisterRequestModel.fromEnity(RegisterRequest registerRequest) {
    return SendRegisterRequestModel(
      mobile: registerRequest.mobile,
      email: registerRequest.email,
      name: registerRequest.name,
    );
  }
}
