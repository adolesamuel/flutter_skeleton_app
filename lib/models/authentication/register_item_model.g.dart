// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterItem _$RegisterItemFromJson(Map<String, dynamic> json) => RegisterItem(
      name: json['full name'] as String,
      phoneNumber: json['mobile number'] as String,
      email: json['email address'] as String,
      password: json['password'] as String?,
      confirmPassword: json['confirm password'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$RegisterItemToJson(RegisterItem instance) =>
    <String, dynamic>{
      'full name': instance.name,
      'mobile number': instance.phoneNumber,
      'email address': instance.email,
      'password': instance.password,
      'confirm password': instance.confirmPassword,
      'otp': instance.otp,
    };
