import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../layout.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController nameC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signup({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return const HomeLayout();
                    }));
              }
            });
          }
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Sign Up',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email',
              style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: emailC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The email cannot be empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Name',
              style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: nameC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The name cannot be empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Phone',
              style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: phoneC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The phone cannot be empty';
                  } else if (value.length < 11) {
                    return 'The phone must be 11 numbers';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Password',
              style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: passwordC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The password cannot be empty';
                  } else if (value.length < 8) {
                    return 'The password must be at least 8 characters';
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () async {
                      await signup(
                        email: emailC.text,
                        password: passwordC.text,
                        phone: phoneC.text,
                        name: nameC.text,
                      );
                    },
                    child: const Text('Sign up',
                    style: TextStyle(fontSize: 20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

