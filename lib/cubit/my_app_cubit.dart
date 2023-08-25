import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';


import '../data/user_data.dart';
import 'my_app_state.dart';


class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

  Future<void> login(
      String email,
      String password,
      ) async {

      try {
        emit(LoginLoadingState());
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value.user != null) {
            emit(LoginDoneState());
          }
        });
      } catch (e) {
        emit(LoginErrorState(
          e.toString()
        ));
      }

  }

  UserDataModel? userData;
  Future<void> getDataFromFirebase() async {

    try {
      emit(GetDataLoadingState());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userA =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userData = UserDataModel(
        name: userA['name'],
        password: userA['password'],
        phone: userA['phone'],
        email: userA['email'],
        uid: userA['uid'],
      );
      emit(GetDataDoneState());
    } catch (e) {
      emit(GetDataErrorState(e.toString()));
    }
  }


  Future<void> signup({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {

      try {
        emit(SignUpLoadingState());
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value.user != null) {
            saveUserData(
              email: email,
              password: password,
              name: name,
              phone: phone,
              uid: value.user!.uid,
            ).then((value) {
              if (value) {
               emit(SignUpDoneState());
              } else {
                emit(SignUpErrorState('SignUp error'));
              }
            });
          }
        });
      } catch (e) {
        emit(SignUpErrorState(e.toString()));
      }

  }


  Future<bool> saveUserData({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String uid,
  }) async {
    try {
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
        'uid': uid,
      }, SetOptions(merge: true));
      return true;
    } catch (error) {
      return false;
    }
  }



  ImagePicker picker = ImagePicker();
  File? img;
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null)
      {
        img = File(image.path);
        emit(PickImageState());
      } else{
      print('null image');
    }
  }

}
