import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer_menu.dart';

class Proflie extends StatelessWidget {
  // HomePage อินเทอร์เฟซหน้าจอ ที่เปลี่ยนค่าไม่ได้
  const Proflie({Key? key}) : super(key: key); //ประกาศตัวแปรสืบทอด คุณสมบัติ
//ประกาศตัวแปรสืบทอด คุณสมบัติ
  @override // สืบทอดคุณสมบัติและมีชื่อ class เหมือนกับ calss แม่
  Widget build(BuildContext context) {
    // สร้าง wiget build
    return const FlutterLayoutArticle([
      //โครงสร้างของแอปจอตัวอย่าง 1-29
      Example1(),
      Example2(),
      Example3(),
      Example4(),
      Example5(),
      Example6(),
      Example7(),
      Example8(),
      Example9(),
      Example10(),
      Example11(),
      Example12(),
    ]);
  }
}

//////////////////////////////////////////////////

abstract class Example extends StatelessWidget {
  //class ข้อความมีการรายงาน
  // HomePage อินเทอร์เฟซหน้าจอ ที่เปลี่ยนค่าไม่ได้
  const Example({Key? key}) : super(key: key);
  // ประกาศตัวแปรสืบทอด คุณสมบัติ
  String get tite; //หัวข้อ
  String get explanation; //ประกาศตัวแปร เก็บข้อข้อความส่วน คำอธิบาย
}

//////////////////////////////////////////////////

class FlutterLayoutArticle extends StatefulWidget {
  //เป็น class ที่ extends ออกมาเป็น StatefulWidget
  const FlutterLayoutArticle(
    // ประกาศตัวแปรตัวอย่าง การจัดวางจอ
    this.examples, {
    Key? key,
  }) : super(key: key); // มีการสืบทอดคุณสมบัติจาก class แม่

  final List<Example> examples; // ประกาศตัวแปรค่าคงที่ เป็น List<> examples

  @override // สืบทอดคุณสมบัติจาก class แม่ และมีการใช้ createState สร้างพื้นที่แสดงจอ
  _FlutterLayoutArticleState createState() => _FlutterLayoutArticleState();
}

//////////////////////////////////////////////////

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  //class หน้า View มี State แม่คือ FlutterLayoutArticle
  //late ทำให้รู้ว่าตัวแปรมีค่ามีข้อมูลอยู่
  late int count; // เลขตัวอย่าง
  late Widget example; // โครงสร้างตัวอย่าง
  late String tite;
  late String explanation; // ข้อความคำอธิบาย

  @override
  void initState() {
    // ส่วนของข้อความด้านใน
    count = 1;
    tite = const Example1().tite;
    explanation = const Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    //ทำการนำเข้าและ Update Widget
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    tite = example.tite;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PageArguments;
    return MaterialApp(
      // จอแสดงผล
      debugShowCheckedModeBanner: false, //วิธีการลบ debug banner
      title: 'Flutter Layout Article',
      home: Scaffold(
        //หลีกเลี่ยงการบุกรุกพื้นที่โดยระบบปฏิบัติการ
        appBar: AppBar(
          title: Text(
            args.title,
            style: const TextStyle(
              color: Colors.black,
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
                FontAwesomeIcons.userAlt,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        drawer: DrawerMenu.menu(context),
        body: SafeArea(
          child: Container(
            height: 1000,
            width: 1000,
            child: Container(
              //ลูก 1
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellowAccent, Colors.redAccent])),
              child: FittedBox(
                //ลูก 2
                child: Container(
                  //ลูก 3 จอแสดงผล layout ตัวอย่าง
                  width: 400,
                  height: 670,
                  child: Column(
                    //ลูก 4 Column
                    crossAxisAlignment:
                        CrossAxisAlignment.center, //จัดเรียงแนวนอน ตรงกลาง
                    children: [
                      //เด็ก 1
                      Expanded(
                          child: ConstrainedBox(
                              //ทำให้ขนาดเท่ากันเป็น Box //ลูก 6
                              constraints: const BoxConstraints.tightFor(
                                  width: double.infinity,
                                  height: double.infinity),
                              child: widget.examples[count - 1])), //ลูก 7
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            colors: [Colors.yellow, Colors.black],
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            //ลูก 8
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //เด็ก 2
                              for (int i = 0;
                                  i < widget.examples.length;
                                  i++) //loop ตัวอย่างหน้าจอ และ ปุ่ม button
                                Container(
                                  width: 100,
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4.0),
                                  child: button(i + 1), //ลูก 9
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        key: ValueKey(count),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.orange, Colors.limeAccent])),
                          child: Center(
                            child: Text(
                              explanation, // ข้อความคำอธิบาย
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.black, // สีน้ำเงิน
                                  fontFamily: "Mali",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        height: 273, //พื้นที่แสดง ข้อความ
                        color: Colors.grey[50],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(int exampleNumber) {
    //ปุ่มกด เลือก layout
    return Button(
      key: ValueKey('button$exampleNumber'),
      isSelected: count == exampleNumber,
      exampleNumber: exampleNumber,
      tite: widget.examples[exampleNumber - 1].tite,
      onPressed: () {
        showExample(
          //แสดง หน้าจอ layout
          widget.examples[exampleNumber - 1].tite,
          exampleNumber, // layout
          widget.examples[exampleNumber - 1].explanation, // ข้อความอธิบายโค้ด
        );
      },
    );
  }

  void showExample(String tite, int exampleNumber, String explanation) {
    //set ข้อมูล หน้าจอ layout
    setState(() {
      this.tite = tite;
      count = exampleNumber;
      this.explanation = explanation;
    });
  }
}

//////////////////////////////////////////////////

class Button extends StatelessWidget {
  //รูปแบบปุ่ม button ของแต่ละปุ่ม
  final bool isSelected;
  final int exampleNumber;
  final String tite;
  final VoidCallback onPressed;

  const Button({
    required Key
        key, // เป็นค่า parameter ที่เราจำเป็นต้องกำหนดค่าสำหรับใช้งานในฟังก์ชั่น
    required this.isSelected,
    required this.exampleNumber,
    required this.tite,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // ข้อความของสร้างปุ่ม
      style: TextButton.styleFrom(
        primary: Colors.black, // ข้อความ สีดำ
        backgroundColor:
            isSelected ? Colors.white : Colors.grey[700], //พื้นหลังปุ่มสีเทา
      ),
      child: Text(tite), // ข้อความบนปุ่ม button
      onPressed: () {
        // ฟังก์ชั่น ที่ใช้เมื่อกดปุ่ม
        Scrollable.ensureVisible(
          // ใช้งานในลูกที่ เป็น column และใช้ร่วมกับ SingleChildScrollView
          context, // การแนบ Widget กับโครงสร้างทั้งหมด
          duration: const Duration(
              milliseconds: 350), // delay การกดปุ่ม 0.350 s จึงแสดง
          curve:
              Curves.easeOut, //การแสดงผลออกมาที่ มีกราฟ ตรงๆ แบบ easeOut ของจอ
          alignment: 0.5, //การจัดตำแหน่งปุ่ม ระยะห่างกัน 0.5 pixel
        );
        onPressed();
      },
    );
  }
}
//////////////////////////////////////////////////

class Example1 extends Example {
  const Example1({Key? key}) : super(key: key);
  @override
  final tite = 'ชื่อ-สกุล';

  @override
  final explanation = 'นาย อภิราช คงแหลม';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/1.jpg',
          height: 240,
          width: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example2 extends Example {
  const Example2({Key? key}) : super(key: key);
  @override
  final tite = 'อายุ';

  @override
  final String explanation = 'อายุ 21 ปี';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/2.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example3 extends Example {
  const Example3({Key? key}) : super(key: key);
  @override
  final tite = 'สาขาวิชา';

  @override
  final String explanation = 'ค.อ.บ.วิศวกรรมไฟฟ้า-วิศวกรรมคอมพิวเตอร์';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/3.png',
          height: 240,
          width: 240,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example4 extends Example {
  const Example4({Key? key}) : super(key: key);
  @override
  final tite = 'มหาวิทยาลัย';

  @override
  final String explanation = 'มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา เชียงใหม่';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/4.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example5 extends Example {
  const Example5({Key? key}) : super(key: key);
  @override
  final tite = 'ที่อยู่';

  @override
  final String explanation =
      '1 ถนนนครปฐม แขวง ดุสิต เขตดุสิต จ.กรุงเทพมหานคร 10300';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/5.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example6 extends Example {
  const Example6({Key? key}) : super(key: key);
  @override
  final tite = 'น้ำหนัก';

  @override
  final String explanation = '70 KG';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/6.png',
          height: 240,
          width: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example7 extends Example {
  const Example7({Key? key}) : super(key: key);
  @override
  final tite = 'ส่วนสูง';

  @override
  final String explanation = '169 cm.';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/7.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example8 extends Example {
  const Example8({Key? key}) : super(key: key);
  @override
  final tite = 'อาหารที่ชอบ';

  @override
  final String explanation = 'แกงเผ็ดไก่';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/8.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example9 extends Example {
  const Example9({Key? key}) : super(key: key);
  @override
  final tite = 'เพศ';

  @override
  final String explanation = 'ชาย';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/9.png',
          height: 240,
          width: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example10 extends Example {
  const Example10({Key? key}) : super(key: key);
  @override
  final tite = 'กีฬาที่ชอบ';

  @override
  final String explanation = 'มวยไทย';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/10.gif',
          height: 240,
          width: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example11 extends Example {
  const Example11({Key? key}) : super(key: key);
  @override
  final tite = 'เกมที่ชอบ';

  @override
  final String explanation = 'ROV';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/11.gif',
          height: 240,
          width: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example12 extends Example {
  const Example12({Key? key}) : super(key: key);
  @override
  final tite = 'รหัส นศ.';

  @override
  final String explanation = '62543502036-1';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/profileim/12.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
