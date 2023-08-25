import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/BlocObserver.dart';
import 'package:task2/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task2/ui/screens/Login_page.dart';
import 'package:task2/ui/screens/Profile_page.dart';
import 'package:task2/ui/screens/SignUp_page.dart';
import 'cubit/my_app_cubit.dart';
import 'layout.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) => AppCubitA()..getDataFromFirebase(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
        )
      ),
      home: user == null ? LoginScreen() : const HomeLayout(),
    );
  }
}












