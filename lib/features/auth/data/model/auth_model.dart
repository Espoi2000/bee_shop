import 'dart:convert';

class AuthModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;

  AuthModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'gender': gender});
    result.addAll({'image': image});
    result.addAll({'accessToken': accessToken});
    result.addAll({'refreshToken': refreshToken});

    return result;
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));
}

class AuthLoginModel {
  final String username;
  final String email;

  AuthLoginModel({required this.email, required this.username});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'email': email});
  
    return result;
  }

  factory AuthLoginModel.fromMap(Map<String, dynamic> map) {
    return AuthLoginModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthLoginModel.fromJson(String source) => AuthLoginModel.fromMap(json.decode(source));
}
