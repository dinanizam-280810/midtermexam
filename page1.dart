import 'package:flutter/material.dart';

class homestay extends StatefulWidget {
  const homestay({super.key});

  @override
  State<homestay> createState() => _homestayState();
}

class _homestayState extends State<homestay> {
  late List<Widget> tabchildren;
int _currentIndex = 0;
String maintitle = "customer";
 @override
  void initState() {
    super.initState();
    tabchildren = const [
      homestay(),
      
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("TAB 1")),
    );
  }
}
