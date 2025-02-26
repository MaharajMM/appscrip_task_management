import 'dart:convert';

class LoginModel {
    final String? token;

    LoginModel({
        this.token,
    });

    LoginModel copyWith({
        String? token,
    }) => 
        LoginModel(
            token: token ?? this.token,
        );

    factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
    };
}
