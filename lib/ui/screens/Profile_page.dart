import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  @override
  void initState() {
    if (DataSource.isLoadingProfile) {
      Future.delayed(Duration.zero, () async {
        var data = await DataSource.getDataFromFirebase();
        setState(() {
          DataSource.userData = data;
          DataSource.isLoadingProfile = false;
        });
      });
    }
    super.initState();
  }
  //User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: const Text('Profile',
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 600,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name',
                    style: TextStyle(color: Colors.grey, fontSize:20 ),
                  ),
                  SizedBox(height: 10,),
                  Text(DataSource.userData!.name,
                    style: TextStyle(color: Colors.white, fontSize: 28),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 600,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone',
                    style: TextStyle(color: Colors.grey, fontSize:20 ),
                  ),
                  SizedBox(height: 10,),
                  Text(DataSource.userData!.phone,
                    style: TextStyle(color: Colors.white, fontSize: 28),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 600,
            height: 90,
            decoration: BoxDecoration
              (
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email',
                    style: TextStyle(color: Colors.grey, fontSize:20 ),
                  ),
                  SizedBox(height: 10,),
                  Text(DataSource.userData!.email,
                    style: TextStyle(color: Colors.white, fontSize: 28),),
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
}
