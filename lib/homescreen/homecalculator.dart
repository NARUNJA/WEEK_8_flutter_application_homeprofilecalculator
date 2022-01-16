import 'package:flutter/material.dart';

class HomeC extends StatelessWidget {
  static const routeName = '/hcalculator';
  // HomePage อินเทอร์เฟซหน้าจอ ที่เปลี่ยนค่าไม่ได้
  const HomeC({Key? key}) : super(key: key); //ประกาศตัวแปรสืบทอด คุณสมบัติ
//ประกาศตัวแปรสืบทอด คุณสมบัติ
  @override // สืบทอดคุณสมบัติและมีชื่อ class เหมือนกับ calss แม่
  Widget build(BuildContext context) {
    // สร้าง wiget build
    return const FlutterLayoutArticle([
      //โครงสร้างของแอปจอตัวอย่าง
      Example1(),
      Example2(),
      Example3(),
      Example4(),
      Example5(),
      Example6(),
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
            'รายละเอียด code Calculator',
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.pink])),
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
                                  colors: [Colors.pink, Colors.white])),
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
  final tite = 'ภาพร่วม Screen Calculator';

  @override
  final explanation =
      '     มีหน้าจอพื้นหลังสีน้ำเงินไล่ระดับสีฟ้า มีปุ่มกดเลขสีขาว มีปุ่มอื่นๆ มีหลายสี';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/ch/1.png',
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
  final tite = 'ส่วนของปุ่ม C , +/- , % , DEL';

  @override
  final String explanation =
      'if (index == 0) { // ใช้ เงื่อนไข if.... else ในการสร้างปุ่ม'
      '\n'
      'return MyButton( // clear หน้าจอ เป็น 0'
      '\n'
      'buttontapped: () {'
      '\n'
      'setState(() {'
      '\n'
      'userInput = “ ”;'
      '\n'
      'answer = “0”;'
      '\n'
      '});'
      '\n'
      ' },'
      '\n'
      ' buttonText: buttons[index], // buttons[0] คือ C'
      '\n'
      'color: Colors.purple[300], // ปุ่มสีม่วง'
      '\n'
      ' textColor: Colors.black, // อักษรสีดำ'
      '\n'
      ');'
      '\n'
      '}'
      '\n'
      ' // ปุ่ม +/- button'
      '\n'
      'else if (index == 1) {'
      '\n'
      'return MyButton('
      '\n'
      'buttonText: buttons[index],'
      '\n'
      'color: Colors.amber,'
      '\n'
      'textColor: Colors.black,'
      '\n'
      ');'
      '\n'
      '}'
      '\n'
      ' // ปุ่ม % button'
      '\n'
      'else if (index == 2) {'
      '\n'
      'return MyButton('
      '\n'
      'buttontapped: () {'
      '\n'
      'setState(() {'
      '\n'
      'userInput += buttons[index];'
      '\n'
      '});'
      '\n'
      '},'
      '\n'
      'buttonText: buttons[index],'
      '\n'
      'color: Colors.lightGreenAccent[400],'
      '\n'
      'textColor: Colors.black,'
      '\n'
      ');'
      '\n'
      '}'
      '\n'
      ' // ปุ่ม Delete Button'
      '\n'
      'else if (index == 3) {'
      '\n'
      'return MyButton('
      '\n'
      'buttontapped: () {'
      '\n'
      'setState(() {'
      '\n'
      'userInput ='
      '\n'
      'userInput.substring(0, userInput.length - 1);'
      '\n'
      '});'
      '\n'
      '},'
      '\n'
      'buttonText: buttons[index],'
      '\n'
      'color: Colors.red[500],'
      '\n'
      'textColor: Colors.black,'
      '\n'
      ');'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/ch/2.png',
          height: 140,
          width: 140,
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
  final tite = 'ส่วนของปุ่ม / ,  x , - , +';

  @override
  final String explanation = 'else {'
      '\n'
      'return MyButton( // ไปสร้างปุ่มที่ class'
      '\n'
      'buttontapped: () {'
      '\n'
      'setState(() {'
      '\n'
      'userInput += buttons[index];  // แสดง userInput'
      '\n'
      '});'
      '\n'
      ' },'
      '\n'
      'buttonText: buttons[index],'
      '\n'
      'color: isOperator(buttons[index])  // ตรวจดู Operator / ,  x , - , +'
      '\n'
      '? Colors.cyanAccent   // สีปุ่ม Operator'
      '\n'
      ': Colors.white, // สีปุ่ม Operand'
      '\n'
      'textColor: isOperator(buttons[index]) // สีอักษร'
      '\n'
      '? Colors.black '
      '\n'
      ': Colors.black,'
      '\n'
      ');'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'assets/ch/3.png',
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
  final tite = 'ส่วนของปุ่มเท่ากับ (=)';

  @override
  final String explanation = '// Equal_to Button'
      '\n'
      'else if (index == 18) { // ถ้าเท่ากับ ลำดับ 18 คือ ='
      '\n'
      ' return MyButton('
      '\n'
      'buttontapped: () {'
      '\n'
      'setState(() {'
      '\n'
      'equalPressed(); // แสดง คำตอบ'
      '\n'
      '});'
      '\n'
      '},'
      '\n'
      'buttonText: buttons[index], '
      '\n'
      'color: Colors.yellowAccent,'
      '\n'
      'textColor: Colors.black,'
      '\n'
      ');'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/ch/4.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class Example5 extends Example {
  const Example5({Key? key}) : super(key: key);
  @override
  final code = ' ';

  @override
  final tite = 'ส่วนของการแสดงคำตอบ';

  @override
  final String explanation = 'bool isOperator(String o) {  // Operator'
      '\n'
      'if (o == “/“ || o == “x“ || o == “-“ || o == “+“ || o == “=“) {  //  ถ้าเป็น Operator  จะทำต่อ'
      '\n'
      'return true;'
      '\n'
      '}'
      '\n'
      'return false;'
      '\n'
      '}'
      '\n'
      'void equalPressed() { // แสดง คำตอบ'
      '\n'
      'String finaluserinput = userInput;  // ข้อมูลที่ใส่ กดเลข'
      '\n'
      'finaluserinput = userInput.replaceAll(“x“, “*“);   // จับคู่ String'
      '\n'
      'Parser p = Parser();'
      '\n'
      'Expression exp = p.parse(finaluserinput);'
      '\n'
      'ContextModel cm = ContextModel();'
      '\n'
      'double eval = exp.evaluate(EvaluationType.REAL, cm);  // ทำเป็นทศนิยม'
      '\n'
      'answer = eval.toString(); //แสดง คำตอบ'
      '\n'
      '}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/ch/5.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class Example6 extends Example {
  const Example6({Key? key}) : super(key: key);
  @override
  final code = ' ';

  @override
  final tite = 'ส่วนของ Class MyButton' '\n' 'ใช้สร้างปุ่ม';

  @override
  final String explanation = 'class MyButton extends StatelessWidget {'
      '\n'
      'final color; '
      '\n'
      'final textColor;'
      '\n'
      'final String buttonText;'
      '\n'
      'final buttontapped;'
      '\n'
      'MyButton('
      '\n'
      '{this.color, this.textColor, this.buttonText = “ ”, this.buttontapped});'
      '\n'
      '@override'
      '\n'
      'Widget build(BuildContext context) {'
      '\n'
      'return GestureDetector('
      '\n'
      'onTap: buttontapped, //ปุ่มกด'
      '\n'
      'child: Padding('
      '\n'
      'padding: EdgeInsets.all(6),'
      '\n'
      'child: ClipRRect('
      '\n'
      '// ทำปุ่มเหลี่ยมมน'
      '\n'
      'borderRadius: BorderRadius.circular(15),'
      '\n'
      'child: Container('
      '\n'
      'color: color,'
      '\n'
      'child: Center('
      '\n'
      'child: Text('
      '\n'
      '// อักษรบนปุ่ม'
      '\n'
      'buttonText,'
      '\n'
      'style: TextStyle('
      '\n'
      'color: textColor,'
      '\n'
      'fontSize: 25,'
      '\n'
      'fontWeight: FontWeight.bold,'
      '\n'
      '),'
      '\n'
      '),'
      '\n'
      '),'
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
      '}'
      '\n';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/ch/1.png',
          height: 240,
          width: 240,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
