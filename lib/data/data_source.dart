import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/data/user_data.dart';

class DataSource {
  static bool isLoading = true;
  static bool isLoadingProfile = true;

  static Future<UserDataModel?> getDataFromFirebase() async {

    try {
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      UserDataModel? user;
      DocumentSnapshot userA =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
      user = UserDataModel(
        name: userA['name'],
        password: userA['password'],
        phone: userA['phone'],
        email: userA['email'],
        uid: userA['uid'],
      );
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static UserDataModel? userData;
}