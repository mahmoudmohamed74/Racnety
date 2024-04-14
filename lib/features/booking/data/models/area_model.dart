import 'package:equatable/equatable.dart';

class AreaModel extends Equatable {
  final int? id;
  final String? name;
  final bool? isAvailable;
  final bool? isDisabled;

  const AreaModel({this.id, this.name, this.isAvailable, this.isDisabled});

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        isAvailable: json['isAvailable'] as bool?,
        isDisabled: json['isDisabled'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isAvailable': isAvailable,
        'isDisabled': isDisabled,
      };

  AreaModel copyWith({
    int? id,
    String? name,
    bool? isAvailable,
    bool? isDisabled,
  }) {
    return AreaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isAvailable: isAvailable ?? this.isAvailable,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  @override
  List<Object?> get props => [id, name, isAvailable, isDisabled];
}
