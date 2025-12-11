import 'package:seed_app/features/advertisements/domain/entities/city.dart';

class CityModel {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  City toEntity() => City(id: id, name: name);

  factory CityModel.fromEntity(City city) =>
      CityModel(id: city.id, name: city.name);
}
