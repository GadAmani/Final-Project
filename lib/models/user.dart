class UserLogin {
  final int id;
  final String name;
  final String email;
  final String? role;
  final String? status;
  final String? phone;
  final String? address;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserLogin({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.status,
    this.phone,
    this.address,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      status: json['status'],
      phone: json['phone'],
      address: json['address'],
      image: json['image'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'status': status,
      'phone': phone,
      'address': address,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class LoginResponse {
  final UserLogin user;
  final String token;

  LoginResponse({required this.user, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: UserLogin.fromJson(json['user']),
      token: json['token'],
    );
  }
}
