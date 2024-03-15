import 'package:equatable/equatable.dart';

class GarageModel extends Equatable {
  final int? id;
  final String? name;
  final double? longitude;
  final double? latitude;

  const GarageModel({this.id, this.name, this.longitude, this.latitude});

  factory GarageModel.fromJson(Map<String, dynamic> json) => GarageModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        longitude:
            json['longitude'] != null ? json['longitude'] as double : 0.0,
        latitude: json['latitude'] != null ? json['latitude'] as double : 0.0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'longitude': longitude,
        'latitude': latitude,
      };

  GarageModel copyWith({
    int? id,
    String? name,
    double? longitude,
    double? latitude,
  }) {
    return GarageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, longitude, latitude];
}
