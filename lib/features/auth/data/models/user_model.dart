import 'package:seed_app/features/auth/domain/entity/user.dart';
class UserModel extends User {
  const UserModel({
    super.id,
    super.name,
    super.email,
    required super.mobile,
    super.image,
    super.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      image: json['image'],
      isVerified: json['is_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'image': image,
      'is_verified': isVerified,
    };
  }
}