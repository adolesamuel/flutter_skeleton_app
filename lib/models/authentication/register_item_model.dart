import 'package:json_annotation/json_annotation.dart';

part 'register_item_model.g.dart';

@JsonSerializable()
class RegisterItem {
  @JsonKey(name: 'full name')
  final String name;

  @JsonKey(name: 'mobile number')
  final String phoneNumber;

  @JsonKey(name: 'email address')
  final String email;

  @JsonKey(name: 'password', defaultValue: null)
  final String? password;

  @JsonKey(name: 'confirm password', defaultValue: null)
  final String? confirmPassword;

  @JsonKey(name: 'otp', defaultValue: null)
  final String? otp;

  RegisterItem({
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.password,
    this.confirmPassword,
    this.otp,
  });

  factory RegisterItem.fromJson(Map<String, dynamic> json) =>
      _$RegisterItemFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterItemToJson(this);
}
