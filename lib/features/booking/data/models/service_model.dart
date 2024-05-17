import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
	final int? id;
	final String? name;
	final int? serviceCost;
	final dynamic pic;

	const ServiceModel({this.id, this.name, this.serviceCost, this.pic});

	factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				serviceCost: json['serviceCost'] as int?,
				pic: json['pic'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'serviceCost': serviceCost,
				'pic': pic,
			};

	ServiceModel copyWith({
		int? id,
		String? name,
		int? serviceCost,
		dynamic pic,
	}) {
		return ServiceModel(
			id: id ?? this.id,
			name: name ?? this.name,
			serviceCost: serviceCost ?? this.serviceCost,
			pic: pic ?? this.pic,
		);
	}

	@override
	List<Object?> get props => [id, name, serviceCost, pic];
}
