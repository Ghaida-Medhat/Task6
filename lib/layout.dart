import 'package:flutter/material.dart';
import 'package:task2/ui/screens/Profile_page.dart';
import 'package:task2/ui/screens/counter_page.dart';
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
    MyPage2(),
    Profile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body:screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.brown.shade700,
          currentIndex: currentIndex,
          onTap: (index) {
            getPage(index);
          },
          items: const [
            BottomNavigationBarItem
              (icon: Icon(Icons.home_filled,),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
        ),

    );
  }
}
