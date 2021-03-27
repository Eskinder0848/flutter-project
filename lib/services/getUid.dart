import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUid {
  final User uid = auth.currentUser;
  

  Future getUid() async {
      return await FirebaseFirestore.instance.collection('user').add({'UserId': uid});
  }
}
