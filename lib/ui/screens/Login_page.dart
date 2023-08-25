import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/my_app_cubit.dart';
import 'package:task2/cubit/my_app_state.dart';
import 'package:task2/layout.dart';
import 'package:task2/ui/screens/SignUp_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back! Glad to see you again!',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: ('Enter your email'),
                  filled: true,
                  fillColor: Colors.grey.shade200
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The email cannot be empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Enter your password'),
                    filled: true,
                    fillColor: Colors.grey.shade200
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The password cannot be empty';
                  } else if (value.length < 8) {
                    return 'The password must be at least 8 characters';
                  }
                },
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: BlocConsumer<AppCubitA, AppStateA>(
                  listener: (context, state) {
                    if(state is LoginErrorState)
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error),
                        ),
                        );
                      } else if(state is LoginDoneState)
                        {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const HomeLayout();
                              }
                              )
                          );
                        }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF300046)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<AppCubitA>().login(
                        emailC.text,
                        passwordC.text,
                      );
                    }
                  },
                      child: state is LoginLoadingState
                      ? const CircularProgressIndicator()
                    : Text('Login',
                        style: TextStyle(fontSize: 20)
                      ),
                );
  },
),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 2,)),
                  Text('Or Login with',
                    style: TextStyle(fontSize: 19, color: Colors.grey.shade900),),
                  Expanded(child: Divider(color: Colors.grey, thickness: 2,))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400),
                      image: DecorationImage(image: AssetImage('assets/images/facebook2.jpg'))
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400),
                        image: DecorationImage(image: AssetImage('assets/images/google3.png'))
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400),
                        image: DecorationImage(image: AssetImage('assets/images/apple.jpg'))
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                  style: TextStyle(fontSize: 17)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,
                        elevation: 0),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const SignUp();
                          }));
                    },
                    child: const Text('Register Now',
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
