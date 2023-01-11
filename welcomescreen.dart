import 'package:flutter/material.dart';
import 'package:homestay_raya/views/login.dart';
import 'package:homestay_raya/views/register.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
       
        padding: const EdgeInsets.all(20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //Image(
               // image: AssetImage('assets/images/register1.jpg'), height:height * 0.3),
            Column(
              children: [
                Text(
                  'Selamat Datang',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Ohayo',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () {
                    Navigator.push(context,
MaterialPageRoute(
         builder: (BuildContext context) =>const LoginPage()));
                  
                    
                  },
                   style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                   foregroundColor: Colors.blue,
                   side: BorderSide(color: Colors.blue),
                   padding: EdgeInsets.symmetric(vertical: 8.0),
                   ),
                   child: Text('Login'.toUpperCase())
                   ),
                   ),

                     const SizedBox(
                  width: 10.0,
                ),
                 Expanded(
                  child:ElevatedButton(onPressed: (){
                    
       Navigator.push(context,
MaterialPageRoute(
         builder: (BuildContext context) =>const RegisterPage()));
                  
                    },
                   
                   style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(),
                   foregroundColor: Colors.white,
                   backgroundColor: Colors.blue,
                   side: BorderSide(color: Colors.blue),
                   padding: EdgeInsets.symmetric(vertical: 8.0),
                   ),
                  child: Text('Signup'.toUpperCase())
                  ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void registerPage(){
  }
}