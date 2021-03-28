import 'package:flutter/material.dart';

class UserModel{
  final String uid;
  final String email;

  UserModel({@required this.uid, this.email});

  factory UserModel.fromJson(dynamic json){
    return UserModel(
      uid: json['uid'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'uid': uid,
        'email': email,
      };

}