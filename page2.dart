import 'package:flutter/material.dart';
import 'package:homestay_raya/models/user.dart';


import 'package:homestay_raya/views/page1.dart';

class profile extends StatefulWidget {
    final User user;
  const profile({Key? key, required this.user}) : super(key: key);
  

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
 late List<Widget> tabchildren;

    @override
  void initState() {
    super.initState();
    tabchildren =  [
      const homestay(),
      profile(user: widget.user),
      
    ];
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Container(),
        
       );
  }
}