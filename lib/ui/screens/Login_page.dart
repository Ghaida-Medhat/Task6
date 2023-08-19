import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/layout.dart';
import 'package:task2/ui/screens/SignUp_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login(
      String email,
      String password,
      ) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value.user != null) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return const HomeLayout();
                }));
          }
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Login',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                  onPressed: () async {
                    await login(
                      emailC.text,
                      passwordC.text,
                    );
                  },
                  child: const Text('login',
                  style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: const Text('OR',
                style: TextStyle(fontSize: 25, color: Colors.brown),),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        }));
                  },
                  child: const Text('Create new account',
                  style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
