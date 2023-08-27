import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/my_app_cubit.dart';
import 'package:task2/cubit/my_app_state.dart';
import '../../data/data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubitA, AppStateA>(
        builder: (context, state) {
          if(context.read<AppCubitA>().userData != null)
            {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 100,
                          backgroundImage: context.read<AppCubitA>().img != null
                          ? FileImage(context.read<AppCubitA>().img!) as ImageProvider
                          : const NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: IconButton(
                              onPressed: (){
                                context.read<AppCubitA>().pickImage();
                              },
                              icon: Icon(Icons.camera_alt_outlined,
                              color: Colors.white,)),
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  /////

                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF300046), width: 2),
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('User Name:',
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                          SizedBox(width: 10),
                          Text(context.read<AppCubitA>().userData!.name,
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF300046), width: 2),
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Email:',
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                          SizedBox(width: 10),
                          Text(context.read<AppCubitA>().userData!.email,
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF300046), width: 2),
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Phone number:',
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                          SizedBox(width: 10),
                          Text(context.read<AppCubitA>().userData!.phone,
                            style: TextStyle(color: Colors.black, fontSize: 20),),
                        ],
                      ),
                    ),
                  ),

                ],
              );
            }
          else{
            return const Text('There is an error');
          }
        },
      ),

    );
  }
}
