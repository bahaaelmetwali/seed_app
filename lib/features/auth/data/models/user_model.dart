import 'package:seed_app/features/auth/domain/entity/user.dart';

class UserModel extends User {
  UserModel(super.phone);
  Map<String, dynamic> toJson() {
    return {'mobile': phone};
  }
  factory UserModel.fromEnity(User user){
 return UserModel(user.phone) ;
  }
}
