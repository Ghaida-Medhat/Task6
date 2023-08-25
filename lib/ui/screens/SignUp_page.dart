import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/my_app_cubit.dart';
import 'package:task2/cubit/my_app_state.dart';

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
  TextEditingController confirmC = TextEditingController();

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
                controller: nameC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Username'),
                    filled: true,
                    fillColor: Colors.grey.shade200
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The name cannot be empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Email'),
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
                controller: phoneC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Phone'),
                    filled: true,
                    fillColor: Colors.grey.shade200
                ),
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
              TextFormField(
                controller: passwordC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Password'),
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
                height: 10,
              ),
              TextFormField(
                controller: confirmC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintText: ('Confirm Password'),
                    filled: true,
                    fillColor: Colors.grey.shade200
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'The password cannot be empty';
                  } else if (value != passwordC.text) {
                    return "The password doesn't match, re-enter it";
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocConsumer<AppCubitA, AppStateA>(
                  listener: (context, state) {
                    if (state is SignUpErrorState)
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error),
                        ),
                        );
                      } else if (state is SignUpDoneState)
                        {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context){
                                return const HomeLayout();
                              },
                              ),
                          );
                        }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF300046)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await context.read<AppCubitA>().signup(
                          email: emailC.text,
                          password: passwordC.text,
                          phone: phoneC.text,
                          name: nameC.text, );
                      }
                    },
                    child: state is SignUpLoadingState ?
                        const Center(
                        child: CircularProgressIndicator(color: Colors.white),)
                        : const Text('Register',
                        style: TextStyle(fontSize: 20)),
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
         ]),
      ),
    ),
    );
  }
}

