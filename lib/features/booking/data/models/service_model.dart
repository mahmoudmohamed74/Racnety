import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final int? id;
  final String? name;
  final String? carName;
  final double? serviceCost;
  final dynamic pic;

  const ServiceModel({
    this.id,
    this.name,
    this.serviceCost,
    this.pic,
    this.carName,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        carName: json['carName'] as String?,
        serviceCost: json['serviceCost'] as double?,
        pic: json['pic'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'carName': carName,
        'serviceCost': serviceCost,
        'pic': pic,
      };

  ServiceModel copyWith({
    int? id,
    String? name,
    String? carName,
    double? serviceCost,
    dynamic pic,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      carName: carName ?? this.carName,
      serviceCost: serviceCost ?? this.serviceCost,
      pic: pic ?? this.pic,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        serviceCost,
        pic,
        carName,
      ];
}
