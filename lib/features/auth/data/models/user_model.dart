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
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] ?? '',
      image: json['image'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
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

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      mobile: mobile,
      image: image,
      isVerified: isVerified,
    );
  }
}
