import 'package:flutter/material.dart';
import 'package:task2/ui/screens/Profile_page.dart';
import 'package:task2/ui/screens/home_page.dart';



class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  void getPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    MyHomePage(),
    Profile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white70,
      body:screens[currentIndex],

        bottomSheet: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              color: Color(0xFF300046),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              getPage(index);
            },
            items: const [
              BottomNavigationBarItem
                (icon: Icon(Icons.home_filled, size: 30),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30,),
                label: 'Profile',
              )
            ],
            unselectedItemColor: Colors.grey.shade600,
            selectedItemColor: Colors.white,
            selectedFontSize: 15,
            unselectedFontSize: 15,
          ),
        ),

    );
  }
}
