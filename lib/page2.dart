import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: const TextStyle(
            fontFamily: 'Mali',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      drawer: DrawerMenu.menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              args.message,
              style: const TextStyle(
                letterSpacing: -12,
                fontSize: 130,
                fontFamily: 'Mali',
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
