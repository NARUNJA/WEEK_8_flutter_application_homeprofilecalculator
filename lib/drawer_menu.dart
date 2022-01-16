import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

class DrawerMenu {
  static Widget menu(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // ส่วนหัว
            decoration: const BoxDecoration(
              // สีพื้นหลัง
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
              ),
            ),
            child: Stack(
              // ใช้ใส่ข้อมูล รูปภาพและ อักษร
              children: [
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        // รูป
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/profileim/1.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // ชื่อ-สกุล
                        padding: const EdgeInsets.only(
                            right: 0, top: 10, left: 0, bottom: 0),
                        child: const Text(
                          'นาย อภิราช คงแหลม',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // สีน้ำเงิน
                              fontFamily: "Mali",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            // Home
            leading: const Icon(FontAwesomeIcons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigator.pushNamed(context, '/');
              // Navigator.push( context,MaterialPageRoute( builder: (context) => const MyHomePage(title: 'Button & Routes')));
              Navigator.pushNamed(context, '/'); // นำทางไปที่ Home
            },
          ),
          const Divider(
            // เส้นสีดำ คั้น
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Profile
            leading: const Icon(FontAwesomeIcons.user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile',
                  arguments: PageArguments('Profile', 'Profile'));
              // มีการนำท่างและ  pass arguments to a named route
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            // Calculator
            leading: const Icon(FontAwesomeIcons.calculator),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.pushNamed(context, '/calculator',
                  arguments: PageArguments('Calculator', 'Calculator'));
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Page 1
            leading: const Icon(FontAwesomeIcons.mobileAlt),
            title: const Text('Page 1'),
            onTap: () {
              // Navigator.pushNamed(context, '/page1');
              Navigator.pushNamed(context, '/page1',
                  arguments: PageArguments('Page1', 'Screen One'));
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            //Page 2
            leading: const Icon(FontAwesomeIcons.mobileAlt),
            title: const Text('Page 2'),
            onTap: () {
              // Navigator.pushNamed(context, '/page2');
              Navigator.pushNamed(context, '/page2',
                  arguments: PageArguments('Page2', 'Screen Two'));
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class PageArguments {
  // class PageArguments
  final String title;
  final String message;
  //constructor
  PageArguments(this.title, this.message);
}
