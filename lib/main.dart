import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';
import 'calculator.dart';
import 'page1.dart';
import 'page2.dart';
import 'homescreen/homeprofile.dart';
import 'homescreen/homecalculator.dart';
import 'homescreen/homemain.dart';
import 'homescreen/homedrawer.dart';
import 'homescreen/homehome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // วิดเจ็ตนี้เป็นรูทของแอปพลิเคชัน
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ธีมสี
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/', // หน้าจอเริ่มต้น
      routes: {
        //หน้าจอที่ เขื่อมต่อ named route
        '/': (context) => const HomeScreen(),
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/calculator': (context) => const CalculatorPage(),
        '/profile': (context) => const Proflie(),

        //Home
        HomeP.routeName: (context) => const HomeP(),
        HomeC.routeName: (context) => const HomeC(),
        HomeM.routeName: (context) => const HomeM(),
        HomeD.routeName: (context) => const HomeD(),
        HomeH.routeName: (context) => const HomeH(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
