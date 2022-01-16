import 'package:flutter/material.dart';

class HomeD extends StatelessWidget {
  static const routeName = '/hdrawer';
  // HomePage อินเทอร์เฟซหน้าจอ ที่เปลี่ยนค่าไม่ได้
  const HomeD({Key? key}) : super(key: key); //ประกาศตัวแปรสืบทอด คุณสมบัติ
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
  String get code; //ประกาศตัวแปร เก็บข้อข้อความส่วนโค้ด ที่สำคัญของตัวอย่าง
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
  late String code; // ข้อความโค้ด
  late String explanation; // ข้อความคำอธิบาย

  @override
  void initState() {
    // ส่วนของข้อความด้านใน
    count = 1;
    tite = const Example1().tite;
    code = const Example1().code;
    explanation = const Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    //ทำการนำเข้าและ Update Widget
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    tite = example.tite;
    code = example.code;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // จอแสดงผล
      debugShowCheckedModeBanner: false, //วิธีการลบ debug banner
      title: 'Flutter Layout Article',
      home: Scaffold(
        //หลีกเลี่ยงการบุกรุกพื้นที่โดยระบบปฏิบัติการ
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'รายละเอียด code Drawer Menu',
            style: TextStyle(
              letterSpacing: -1,
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
        ),
        body: SafeArea(
          child: Container(
            height: 1000,
            width: 1000,
            child: Container(
              //ลูก 1
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(4, 220, 50, 10),
                    Color.fromRGBO(10, 50, 50, 1),
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                ),
              ),
              child: FittedBox(
                //ลูก 2
                child: Container(
                  //ลูก 3 จอแสดงผล layout ตัวอย่าง
                  width: 440,
                  height: 743,
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
                                  width: 110,
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
                              colors: [
                                Color.fromRGBO(4, 50, 50, 10),
                                Color.fromRGBO(10, 150, 50, 1),
                              ],
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                            ),
                          ),
                          child: Container(
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                              Colors.white,
                                              Colors.white
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                tite, // ข้อความคำอธิบายโค้ด
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors
                                                        .black, // สีน้ำเงิน
                                                    fontFamily: "Mali",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Divider(
                                                height: 10,
                                                thickness: 2,
                                                indent: 0,
                                                endIndent: 0,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                explanation, // ข้อความคำอธิบายโค้ด
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors
                                                        .black, // สีน้ำเงิน
                                                    fontFamily: "Mali",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
          widget.examples[exampleNumber - 1].code, // ข้อความโค้ด
          widget.examples[exampleNumber - 1].explanation, // ข้อความอธิบายโค้ด
        );
      },
    );
  }

  void showExample(
      String tite, int exampleNumber, String code, String explanation) {
    //set ข้อมูล หน้าจอ layout
    setState(() {
      this.tite = tite;
      count = exampleNumber;
      this.code = code;
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
        primary: Colors.white, // ข้อความ สีขาว
        backgroundColor:
            isSelected ? Colors.grey : Colors.grey[800], //พื้นหลังปุ่มสีเทา
      ),
      child: Text(exampleNumber.toString()), // ข้อความบนปุ่ม button
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
  final code = ' ';

  @override
  final tite = 'ภาพรวม DrawerMenu';

  @override
  final explanation =
      '         มี 2 ส่วนหลัก คือ 1.ส่วนของ DrawerHeader และ 2.ส่วนของ ListTile';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/dh/3.png',
          height: 140,
          width: 140,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example2 extends Example {
  const Example2({Key? key}) : super(key: key);
  @override
  final code = ' ';

  @override
  final tite = 'ส่วนของ DrawerHeader';

  @override
  final String explanation = 'DrawerHeader( // ส่วนหัว'
      '\n'
      'decoration: const BoxDecoration( // สีพื้นหลัง'
      '\n'
      'gradient: LinearGradient('
      '\n'
      'colors: [Colors.red, Colors.orange],'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'child: Stack( // ใช้ใส่ข้อมูล รูปภาพและ อักษร'
      '\n'
      'children: ['
      '\n'
      'Center('
      '\n'
      'child: Column('
      '\n'
      'children: ['
      '\n'
      'Expanded( // รูป'
      '\n'
      'child: Container('
      '\n'
      'child: ClipRRect('
      '\n'
      'borderRadius: BorderRadius.circular(15),'
      '\n'
      'child: Image.asset('
      '\n'
      '“assets/profileim/1.jpg”,'
      '\n'
      'height: 150,'
      '\n'
      'width: 150,'
      '\n'
      'fit: BoxFit.cover,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'Container( // ชื่อ-สกุล'
      '\n'
      'padding: const EdgeInsets.only('
      '\n'
      'right: 0, top: 10, left: 0, bottom: 0),'
      '\n'
      'child: const Text('
      '\n'
      '“นาย อภิราช คงแหลม”,'
      '\n'
      'style: TextStyle('
      '\n'
      'fontSize: 18,'
      '\n'
      'color: Colors.black, // สีน้ำเงิน'
      '\n'
      'fontFamily: "Mali",'
      '\n'
      'fontWeight: FontWeight.w500),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '],'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '],'
      '\n'
      '),'
      '\n'
      '),';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/dh/4.png',
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
  final code = ' ';

  @override
  final tite = 'ส่วนของ ListTile';

  @override
  final String explanation = 'ListTile('
      '\n'
      '// Home'
      '\n'
      'leading: const Icon(FontAwesomeIcons.home),'
      '\n'
      'title: const Text(“Home”),'
      '\n'
      'onTap: () {'
      '\n'
      'Navigator.pushNamed(context, “/”); // นำทางไปที่ Home'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      'const Divider('
      '\n'
      ' // เส้นสีดำ คั้น'
      '\n'
      'height: 10,'
      '\n'
      'thickness: 2,'
      '\n'
      'indent: 0,'
      '\n'
      'endIndent: 0,'
      '\n'
      'color: Colors.black,'
      '\n'
      '),'
      '\n'
      'ListTile('
      '\n'
      '//Profile'
      '\n'
      'leading: const Icon(FontAwesomeIcons.user),'
      '\n'
      'title: const Text(“Profile”),'
      '\n'
      'onTap: () {'
      '\n'
      ' Navigator.pushNamed(context, “/profile”,'
      '\n'
      'arguments: PageArguments(“Profile”, “Profile”));'
      '\n'
      '// มีการนำท่างและ  pass arguments to a named route'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      'const Divider('
      '\n'
      'height: 10,'
      '\n'
      'thickness: 2,'
      '\n'
      'indent: 0,'
      '\n'
      'endIndent: 0,'
      '\n'
      'color: Colors.black,'
      '\n'
      '),'
      '\n'
      'ListTile(// Calculator'
      '\n'
      'leading: const Icon(FontAwesomeIcons.calculator),'
      '\n'
      'title: const Text(“Calculator”),'
      '\n'
      'onTap: () {'
      '\n'
      'Navigator.pushNamed(context, “/calculator”,'
      '\n'
      'arguments: PageArguments(“Calculator”, “Calculator”));'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      'const Divider('
      '\n'
      'height: 10,'
      '\n'
      'thickness: 2,'
      '\n'
      'indent: 0,'
      '\n'
      'endIndent: 0,'
      '\n'
      'color: Colors.black,'
      '\n'
      '),'
      '\n'
      'ListTile(//Page 1'
      '\n'
      'leading: const Icon(FontAwesomeIcons.mobileAlt),'
      '\n'
      'title: const Text(“Page 1”),'
      '\n'
      'onTap: () {'
      '\n'
      'Navigator.pushNamed(context, “/page1”,'
      '\n'
      ' arguments: PageArguments(“Page1”, “Screen One”));'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      'const Divider('
      '\n'
      'height: 10,'
      '\n'
      'thickness: 2,'
      '\n'
      'indent: 0,'
      '\n'
      'endIndent: 0,'
      '\n'
      'color: Colors.black,'
      '\n'
      '),'
      '\n'
      'ListTile(//Page 2'
      '\n'
      'leading: const Icon(FontAwesomeIcons.mobileAlt),'
      '\n'
      'title: const Text(“Page 2”),'
      '\n'
      'onTap: () {'
      '\n'
      'Navigator.pushNamed(context, “/page2”,'
      '\n'
      'arguments: PageArguments(“Page2”, “Screen Two”));'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      'const Divider('
      '\n'
      'height: 10,'
      '\n'
      'thickness: 2,'
      '\n'
      'indent: 0,'
      '\n'
      'endIndent: 0,'
      '\n'
      'color: Colors.black,'
      '\n'
      '),';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/dh/5.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example4 extends Example {
  const Example4({Key? key}) : super(key: key);
  @override
  final code = ' ';

  @override
  final tite = 'ส่วนของ PageArguments';

  @override
  final String explanation =
      'class PageArguments { // เป็น Class เก็บ และส่งข้อความ'
      '\n'
      'final String title;'
      '\n'
      'final String message;'
      '\n'
      '//constructor'
      '\n'
      'PageArguments(this.title, this.message);'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/dh/6.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
