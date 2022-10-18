import 'dart:convert';

class AuthenticatedUser {
  final String? userId;
  final String name;
  final String email;
  final String phone;
  final String? otp;
  final String? token;

  AuthenticatedUser({
    this.userId,
    required this.name,
    required this.email,
    required this.phone,
    this.otp,
    this.token,
  });

  ///This map is structured to work with json returned from login Endpoint
  factory AuthenticatedUser.fromMap(Map map) {
    final String? token = map['token'] as String?;

    return AuthenticatedUser(
      name: map['full_name'] as String,
      email: map['email'] as String,
      phone: map['phone_number'] as String,
      otp: map['otp'] as String?,
      token: token,
    );
  }

  String toJson() {
    //convert the authenticated user to json

    final Map<String, dynamic> mapObject = {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'otp': otp,
      'token': token,
    };

    return json.encode(mapObject);
  }

  //copy Authenticated user and update localProfileImageAsBase64
  AuthenticatedUser copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? otp,
    String? token,
  }) {
    return AuthenticatedUser(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      token: token ?? this.token,
    );
  }

  factory AuthenticatedUser.fromJson(String jsonData) {
    final data = json.decode(jsonData);

    return AuthenticatedUser(
      userId: data['userId'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      otp: data['otp'],
      token: data['token'],
    );
  }
}
