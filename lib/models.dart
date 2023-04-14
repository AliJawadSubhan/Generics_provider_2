class ApiResponse<T extends ApiDataModel> {
  String? message;
  int? statusCode;
  T? data;

  ApiResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  ApiResponse.fromJson(Map<String, dynamic> json, T data) {
    message = json['message'];
    statusCode = json['statusCode'];
    this.data = data;
  }
}

abstract class ApiDataModel {
  Map<String, dynamic> toJson();
}

class AppUser implements ApiDataModel {
  int id;
  String phone;
  String email;
  String accessToken;

  AppUser({
    required this.id,
    required this.phone,
    required this.email,
    required this.accessToken,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      accessToken: json["accessToken"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'email': email,
      'accessToken': accessToken,
    };
  }
}
