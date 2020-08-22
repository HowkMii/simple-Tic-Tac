import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),

      
    );
  }
}

class HomePage extends StatefulWidget {

  @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>  displayExOh =['','','','','','','','','',];

  
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext contex,int index){
            return GestureDetector(
              onTap:(){_tapped(index);
              },

              
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all( color: Colors.grey[700])
                ),
                child: Center(
                  child: Text(displayExOh[index],style: TextStyle(color: Colors.white,fontSize: 40),),),
              ),
            );
          }),
     
  
    );
   
  }
  void _tapped( int index){
    setState(() {
      displayExOh[index] = 'o';
    });

    
  }
  
}
