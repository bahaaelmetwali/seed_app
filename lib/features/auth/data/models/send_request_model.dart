import 'package:seed_app/features/auth/domain/entity/send_request.dart';

class SendMobileRequestModel extends SendRequest {
  SendMobileRequestModel({required super.mobile});

  Map<String, dynamic> toJson() => {'mobile': mobile};
  factory SendMobileRequestModel.fromEnity(SendRequest sendRequest) {
    return SendMobileRequestModel(mobile: sendRequest.mobile);
  }
}
