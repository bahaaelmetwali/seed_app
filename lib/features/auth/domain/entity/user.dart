class User {
  final int? id;
  final String? name;
  final String? email;
  final String mobile;
  final String? image;
  final bool? isVerified;

  const User({
    this.id,
    this.name,
    this.email,
    required this.mobile,
    this.image,
    this.isVerified,
  });
}