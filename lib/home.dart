import 'package:flutter/material.dart';
import 'homescreen/homeprofile.dart';
import 'homescreen/homecalculator.dart';
import 'homescreen/homedrawer.dart';
import 'homescreen/homehome.dart';
import 'homescreen/homemain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Mali',
            fontWeight: FontWeight.w900,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            icon: const Icon(
              FontAwesomeIcons.home,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerMenu.menu(context), // มี ลิ้นชัก DrawerMenu
      body: Center(
        child: Container(
          height: 1000,
          width: 1000,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green, Colors.blue])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(children: <Widget>[
                // ทำการใส่รูปและข้อความ
                Container(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/profileim/21.png',
                      height: 100,
                      width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0, 20, 0, 0), //ปรับตำแหน่ง
                    alignment: Alignment.center,
                    child: const Text(
                      'รายละเอียด Code',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: -1,
                          fontFamily: 'Mali',
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0),
                    )),
              ]),
              Container(
                padding: EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, //background color of button
                      side: const BorderSide(
                          width: 3,
                          color: Colors.black), //border width and color
                      elevation: 20, //elevation of button เงา
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: const Text(
                    "Main",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    // ทำงานเมื่อกดปุ่ม
                    Navigator.pushNamed(context, HomeM.routeName);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, //background color of button
                      side: const BorderSide(
                          width: 3,
                          color: Colors.black), //border width and color
                      elevation: 20, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: const Text(
                    "Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    // ทำงานเมื่อกดปุ่ม
                    setState(() {
                      Navigator.pushNamed(context, HomeH.routeName);
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, //background color of button
                      side: const BorderSide(
                          width: 3,
                          color: Colors.black), //border width and color
                      elevation: 20, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: const Text(
                    "Proflie",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    // ทำงานเมื่อกดปุ่ม
                    setState(() {
                      Navigator.pushNamed(context, HomeP.routeName);
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, //background color of button
                      side: const BorderSide(
                          width: 3,
                          color: Colors.black), //border width and color
                      elevation: 20, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: const Text(
                    "Calculator",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    // ทำงานเมื่อกดปุ่ม
                    setState(() {
                      Navigator.pushNamed(context, HomeC.routeName);
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, //background color of button
                      side: const BorderSide(
                          width: 3,
                          color: Colors.black), //border width and color
                      elevation: 20, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  child: const Text(
                    "Drawer Display",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mali',
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    // ทำงานเมื่อกดปุ่ม
                    setState(() {
                      Navigator.pushNamed(context, HomeD.routeName);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
