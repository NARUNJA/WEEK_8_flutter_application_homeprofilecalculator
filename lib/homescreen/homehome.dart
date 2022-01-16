import 'package:flutter/material.dart';

class HomeH extends StatelessWidget {
  static const routeName = '/hhome';
  // HomePage อินเทอร์เฟซหน้าจอ ที่เปลี่ยนค่าไม่ได้
  const HomeH({Key? key}) : super(key: key); //ประกาศตัวแปรสืบทอด คุณสมบัติ
//ประกาศตัวแปรสืบทอด คุณสมบัติ
  @override // สืบทอดคุณสมบัติและมีชื่อ class เหมือนกับ calss แม่
  Widget build(BuildContext context) {
    // สร้าง wiget build
    return const FlutterLayoutArticle([
      //โครงสร้างของแอปจอตัวอย่าง 1-29
      Example1(),
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
            'รายละเอียด code Home',
            style: TextStyle(
              letterSpacing: -0.5,
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.pink, Colors.lime])),
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
                                  width: 300,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      100, 0, 0, 0),
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
                                  colors: [Colors.lime, Colors.pink])),
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
      child: Text(
        'HOME',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Mali',
          fontWeight: FontWeight.w600,
        ),
      ), // ข้อความบนปุ่ม button
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
  final tite = 'ส่วนของ Main คือ ' '\n' 'ส่วนหลัก ที่รวมทำงาน';

  @override
  final explanation = 'class HomeScreen extends StatefulWidget {'
      '\n'
      'static const routeName = “ / ”;'
      '\n'
      'const HomeScreen({Key? key}) : super(key: key);'
      '\n'
      '@override'
      '\n'
      'State<StatefulWidget> createState() {'
      '\n'
      'return _HomeScreenState();'
      '\n'
      '}'
      '\n'
      '}'
      '\n'
      'class _HomeScreenState extends State<HomeScreen> {'
      '\n'
      '@override'
      '\n'
      'Widget build(BuildContext context) {'
      '\n'
      'return Scaffold('
      '\n'
      'appBar: AppBar('
      '\n'
      'title: const Text('
      '\n'
      '“Home”,'
      '\n'
      'style: TextStyle('
      '\n'
      'fontFamily: “Mali”,'
      '\n'
      'fontWeight: FontWeight.w900,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'flexibleSpace: Container('
      '\n'
      'decoration: const BoxDecoration('
      '\n'
      'gradient: LinearGradient('
      '\n'
      'colors: [Colors.red, Colors.orange],'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'drawer: DrawerMenu.menu(context), // มี ลิ้นชัก DrawerMenu'
      '\n'
      'body: Center('
      '\n'
      'child: Container('
      '\n'
      'height: 1000,'
      '\n'
      'width: 1000,'
      '\n'
      'decoration: const BoxDecoration('
      '\n'
      'gradient: LinearGradient('
      '\n'
      'begin: Alignment.topLeft,'
      '\n'
      'end: Alignment.bottomRight,'
      '\n'
      'colors: [Colors.green, Colors.blue])),'
      '\n'
      'child: Column('
      '\n'
      'mainAxisAlignment: MainAxisAlignment.center,'
      '\n'
      'children: <Widget>['
      '\n'
      'Stack(children: <Widget>['
      '\n'
      '// ทำการใส่รูปและข้อความ'
      '\n'
      'Container('
      '\n'
      'child: ClipRRect('
      '\n'
      'child: Image.asset('
      '\n'
      '“assets/profileim/21.png”,'
      '\n'
      'height: 100,'
      '\n'
      'width: 400,'
      '\n'
      'fit: BoxFit.fill,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'Container('
      '\n'
      'padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0), //ปรับตำแหน่ง'
      '\n'
      'alignment: Alignment.center,'
      '\n'
      'child: const Text('
      '\n'
      '“รายละเอียด Code”,'
      '\n'
      'style: TextStyle('
      '\n'
      'color: Colors.white,'
      '\n'
      'letterSpacing: -1,'
      '\n'
      'fontFamily: “Mali”,'
      '\n'
      'fontWeight: FontWeight.w500,'
      '\n'
      'fontSize: 30.0),'
      '\n'
      ')),'
      '\n'
      ']),'
      '\n'
      'Container('
      '\n'
      'padding: EdgeInsets.all(5.0),'
      '\n'
      'child: ElevatedButton('
      '\n'
      'style: ElevatedButton.styleFrom('
      '\n'
      'primary: Colors.greenAccent, // พื้นหลังปุ่ม'
      '\n'
      'side: const BorderSide('
      '\n'
      'width: 3, // ความหนาของขอบ'
      '\n'
      'color: Colors.black), //border width and color'
      '\n'
      'elevation: 20, //ตำแหน่ง เงา'
      '\n'
      'shape: RoundedRectangleBorder('
      '\n'
      ' //รูปร่างปุ่ม'
      '\n'
      'borderRadius: BorderRadius.circular(30)),//ความขอบมน'
      '\n'
      'padding:'
      '\n'
      'EdgeInsets.all(20) //ระยะห่าง'
      '\n'
      '),'
      '\n'
      'child: const Text('
      '\n'
      '“Main”,'
      '\n'
      'textAlign: TextAlign.center,'
      '\n'
      'style: TextStyle('
      '\n'
      'color: Colors.black,'
      '\n'
      'fontFamily: “Mali”,'
      '\n'
      'fontWeight: FontWeight.w600,'
      '\n'
      'fontSize: 25.0,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'onPressed: () {'
      '\n'
      '  // ทำงานเมื่อกดปุ่ม'
      '\n'
      'setState(() {'
      '\n'
      'Navigator.pushNamed(context, HomeM.routeName);'
      '\n'
      '});'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'Container('
      'padding: EdgeInsets.all(10.0),'
      '\n'
      'child: ElevatedButton('
      '\n'
      'style: ElevatedButton.styleFrom('
      '\n'
      'primary: Colors.greenAccent, //background color of button'
      '\n'
      'side: const BorderSide('
      '\n'
      'width: 3,'
      '\n'
      'color: Colors.black), //border width and color'
      '\n'
      'elevation: 20, //elevation of button'
      '\n'
      'shape: RoundedRectangleBorder('
      '\n'
      '//to set border radius to button'
      '\n'
      'borderRadius: BorderRadius.circular(30)),'
      '\n'
      'padding:'
      '\n'
      'EdgeInsets.all(20) //content padding inside button'
      '\n'
      '),'
      '\n'
      'child: const Text('
      '\n'
      '“Home”,'
      '\n'
      'textAlign: TextAlign.center,'
      '\n'
      'style: TextStyle('
      '\n'
      'color: Colors.black,'
      '\n'
      'fontFamily: “Mali”'
      '\n'
      'fontWeight: FontWeight.w600,'
      '\n'
      'fontSize: 25.0,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      'onPressed: () {'
      '\n'
      '  // ทำงานเมื่อกดปุ่ม'
      '\n'
      'setState(() {'
      '\n'
      'Navigator.pushNamed(context, HomeH.routeName);'
      '\n'
      '});'
      '\n'
      '},'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '//.......เช่นเดียวกันกับอีก 3 ปุ่ม(Profile , Calculator , DrawerMenu )'
      '\n'
      '],'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      ');'
      '\n'
      '}'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/hh/1.png',
          height: 140,
          width: 140,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
