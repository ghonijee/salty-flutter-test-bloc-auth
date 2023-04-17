import 'package:flutter/material.dart';

class TokenModel {
  late String token;

  TokenModel({required this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
}
