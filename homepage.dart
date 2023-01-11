import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homestay_raya/models/user.dart';
import 'package:homestay_raya/views/newhomestay.dart';
import 'package:homestay_raya/views/page1.dart';


class homePage extends StatefulWidget {
   
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Buyer";

  @override
  void initState() {
    super.initState();
    tabchildren = const [
      homestay(),
    ];
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Homestay',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Homestay'),
            
            leading: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.menu,),
              
          ),
          actions:<Widget>[
            Padding(padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                
              }, 
              child: Icon(Icons.search,size: 20.0,),
              )
              ),
              Padding(
                padding: EdgeInsets.only(right:10.0),
              child: GestureDetector(onTap: () {
                Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const
            newHomestayPage(),));
              },

              child:Icon(Icons.more_vert),)),],),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
              ),
              label: "Buyer"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile")
        ],
      ),
      ),
    );
  }



  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        maintitle = "Seller";
      }

      if (_currentIndex == 1) {
        maintitle = "Profile";
      }
    });
  }
/*void _test(){
   Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const 
            newHomestayPage(),));
}*/
}
