import 'package:equatable/equatable.dart';

class GarageModel extends Equatable {
  final int? id;
  final String? name;
  final double? longitude;
  final double? latitude;
  final int? capacity;
  final int? freeArea;
  final int? reservedArea;

  const GarageModel({
    this.id,
    this.name,
    this.longitude,
    this.latitude,
    this.capacity,
    this.freeArea,
    this.reservedArea,
  });

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      longitude: json['longitude'] != null ? json['longitude'] as double : 0.0,
      latitude: json['latitude'] != null ? json['latitude'] as double : 0.0,
      capacity: json['capacity'] as int?,
      freeArea: json['freeArea'] as int?,
      reservedArea: json['reserverdArea'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'longitude': longitude,
        'latitude': latitude,
        'capacity': capacity,
        'freeArea': freeArea,
        'reserverdArea': reservedArea,
      };

  GarageModel copyWith({
    int? id,
    String? name,
    double? longitude,
    double? latitude,
    int? capacity,
    int? freeArea,
    int? reservedArea,
  }) {
    return GarageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      capacity: capacity ?? this.capacity,
      freeArea: freeArea ?? this.freeArea,
      reservedArea: reservedArea ?? this.reservedArea,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        name,
        longitude,
        latitude,
        capacity,
        freeArea,
        reservedArea,
      ];
}
