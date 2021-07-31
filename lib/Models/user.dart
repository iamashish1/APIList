// import 'dart:convert';

// import 'package:flutter/material.dart';

class User {
  String id;
  String name;
  String username;
  String email;

  User({
    this.id,
    this.username,
    this.email,
    this.name,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}
