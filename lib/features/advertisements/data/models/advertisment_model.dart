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
  final List<FranchiseCity> franchiseCities;
  final double? franchiseFees;
  final double? managementFranchiseFeeRatio;
  final int completeSell;
  final double? askMoney;
  final double? partnershipRatio;
  final double? totalProjectEvaluation;
  final String status;
  final DateTime createdAt;
  final DateTime publishedAt;
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
    required this.franchiseCities,
    this.franchiseFees,
    this.managementFranchiseFeeRatio,
    required this.completeSell,
    this.askMoney,
    this.partnershipRatio,
    this.totalProjectEvaluation,
    required this.status,
    required this.createdAt,
    required this.publishedAt,
    required this.isMine,
  });

  factory AdvertismentModel.fromJson(Map<String, dynamic> json) {
    return AdvertismentModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      mainImage: json['main_image'],
      category: json['category'],
      isOnline: json['is_online'] == 1,
      url: json['url'],
      city: json['city'],
      franchiseCities: (json['franchise_cities'] as List)
          .map((e) => FranchiseCity(id: e['id'], name: e['name']))
          .toList(),
      franchiseFees: json['franchise_fees'] != null
          ? double.tryParse(json['franchise_fees'].toString())
          : null,
      managementFranchiseFeeRatio:
          json['management_franchise_fee_ratio'] != null
          ? double.tryParse(json['management_franchise_fee_ratio'].toString())
          : null,
      completeSell: json['complete_sell'],
      askMoney: json['ask_money']?.toDouble(),
      partnershipRatio: json['partnership_ratio']?.toDouble(),
      totalProjectEvaluation: json['total_project_evaluation']?.toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      publishedAt: DateTime.parse(json['published_at']),
      isMine: json['is_mine'],
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

class FranchiseCity {
  final int id;
  final String name;

  FranchiseCity({required this.id, required this.name});
}
