import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';

class AdvertismentModel {
  final int id;
  final String code;
  final String name;
  final String mainImage;
  final String category;
  final bool isOnline;
  final String? url;
  final String? city;
  final double? franchiseFees;
  final double? managementFranchiseFeeRatio;
  final int completeSell;
  final double? askMoney;
  final double? partnershipRatio;
  final double? totalProjectEvaluation;
  final String status;
  final bool isMine;

  AdvertismentModel({
    required this.id,
    required this.code,
    required this.name,
    required this.mainImage,
    required this.category,
    required this.isOnline,
    this.url,
    this.city,
    this.franchiseFees,
    this.managementFranchiseFeeRatio,
    required this.completeSell,
    this.askMoney,
    this.partnershipRatio,
    this.totalProjectEvaluation,
    required this.status,
    required this.isMine,
  });

  factory AdvertismentModel.fromJson(Map<String, dynamic> json) {
    return AdvertismentModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      mainImage: json['main_image'] ?? '',
      category: json['category'] ?? '',
      isOnline: json['is_online'] == 1,
      url: json['url'] ?? '',
      city: json['city'] ?? '',
      franchiseFees: _toDouble(json['franchise_fees']),
      managementFranchiseFeeRatio: _toDouble(
        json['management_franchise_fee_ratio'],
      ),
      completeSell: json['complete_sell'] ?? 0,
      askMoney: _toDouble(json['ask_money']),
      partnershipRatio: _toDouble(json['partnership_ratio']),
      totalProjectEvaluation: _toDouble(json['total_project_evaluation']),
      status: json['status'] ?? '',
      isMine: json['is_mine'] ?? false,
    );
  }

  Advertisment toEntity() {
    return Advertisment(
      totalProjectEvaluation: totalProjectEvaluation ?? 0,
      partnershipRatio: partnershipRatio ?? 0,
      askMoney: askMoney ?? 0,
      isOnline: isOnline,
      city: city ?? '',
      image: mainImage.isNotEmpty
          ? mainImage
          : 'https://via.placeholder.com/150',
      name: name,
    );
  }
}

double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  return double.tryParse(value.toString()) ?? 0.0;
}
