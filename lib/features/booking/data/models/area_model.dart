import 'package:equatable/equatable.dart';

class AreaModel extends Equatable {
	final int? id;
	final String? fullName;
	final String? phoneNumber;
	final String? bookDuration;
	final int? accountId;
	final String? slot;
	final String? area;

	const AreaModel({
		this.id, 
		this.fullName, 
		this.phoneNumber, 
		this.bookDuration, 
		this.accountId, 
		this.slot, 
		this.area, 
	});

	factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
				id: json['id'] as int?,
				fullName: json['fullName'] as String?,
				phoneNumber: json['phoneNumber'] as String?,
				bookDuration: json['bookDuration'] as String?,
				accountId: json['accountId'] as int?,
				slot: json['slot'] as String?,
				area: json['area'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'fullName': fullName,
				'phoneNumber': phoneNumber,
				'bookDuration': bookDuration,
				'accountId': accountId,
				'slot': slot,
				'area': area,
			};

	AreaModel copyWith({
		int? id,
		String? fullName,
		String? phoneNumber,
		String? bookDuration,
		int? accountId,
		String? slot,
		String? area,
	}) {
		return AreaModel(
			id: id ?? this.id,
			fullName: fullName ?? this.fullName,
			phoneNumber: phoneNumber ?? this.phoneNumber,
			bookDuration: bookDuration ?? this.bookDuration,
			accountId: accountId ?? this.accountId,
			slot: slot ?? this.slot,
			area: area ?? this.area,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				fullName,
				phoneNumber,
				bookDuration,
				accountId,
				slot,
				area,
		];
	}
}
