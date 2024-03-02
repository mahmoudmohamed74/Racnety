import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? userId;
  final String? userName;
  final int? expiresIn;
  final int? creationTime;
  final int? expirationTime;
  final int? accountId;

  const UserModel({
    this.accessToken,
    this.tokenType,
    this.userId,
    this.userName,
    this.expiresIn,
    this.creationTime,
    this.expirationTime,
    this.accountId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['access_token'] as String?,
        tokenType: json['token_type'] as String?,
        userId: json['user_Id'] as int?,
        userName: json['user_name'] as String?,
        expiresIn: json['expires_in'] as int?,
        creationTime: json['creation_Time'] as int?,
        expirationTime: json['expiration_Time'] as int?,
        accountId: json['accountid'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'user_Id': userId,
        'user_name': userName,
        'expires_in': expiresIn,
        'creation_Time': creationTime,
        'expiration_Time': expirationTime,
        'accountid': accountId,
      };

  UserModel copyWith({
    String? accessToken,
    String? tokenType,
    int? userId,
    String? userName,
    int? expiresIn,
    int? creationTime,
    int? expirationTime,
    int? accountId,
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      expiresIn: expiresIn ?? this.expiresIn,
      creationTime: creationTime ?? this.creationTime,
      expirationTime: expirationTime ?? this.expirationTime,
      accountId: accountId ?? this.accountId,
    );
  }

  @override
  String toString() {
    return 'UserModel { '
        'accessToken: $accessToken, '
        'tokenType: $tokenType, '
        'userId: $userId, '
        'userName: $userName, '
        'expiresIn: $expiresIn, '
        'creationTime: $creationTime, '
        'expirationTime: $expirationTime, '
        'accountId: $accountId }';
  }

  @override
  List<Object?> get props {
    return [
      accessToken,
      tokenType,
      userId,
      userName,
      expiresIn,
      creationTime,
      expirationTime,
      accountId,
    ];
  }
}
