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
  bool ohTurn = true; 
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
      if(ohTurn){
        displayExOh[index] ='H';

      }else{
        displayExOh[index] ='K';
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });

    
  }
  Void  _checkWinner(){
    if(displayExOh[0] == displayExOh[1] && 
       displayExOh[0] == displayExOh[2] &&
       displayExOh[0] !=''){
       _showWinDialog(displayExOh[0]);
    }
    if(displayExOh[3] == displayExOh[4] && 
       displayExOh[3] == displayExOh[5] &&
       displayExOh[3] !=''){
       _showWinDialog(displayExOh[3]);
    }
    if(displayExOh[6] == displayExOh[7] && 
       displayExOh[6] == displayExOh[8] &&
       displayExOh[6] !=''){
       _showWinDialog(displayExOh[6]);
    }
    if(displayExOh[0] == displayExOh[3] && 
       displayExOh[0] == displayExOh[6] &&
       displayExOh[0] !=''){
       _showWinDialog(displayExOh[0]);
    }
    if(displayExOh[1] == displayExOh[4] && 
       displayExOh[1] == displayExOh[7] &&
       displayExOh[1] !=''){
       _showWinDialog(displayExOh[1]);
    }
    if(displayExOh[2] == displayExOh[5] && 
       displayExOh[2] == displayExOh[8] &&
       displayExOh[2] !=''){
       _showWinDialog(displayExOh[2]);
    }
    if(displayExOh[6] == displayExOh[4] && 
       displayExOh[6] == displayExOh[2] &&
       displayExOh[6] !=''){
       _showWinDialog(displayExOh[6]);
    }
    if(displayExOh[0] == displayExOh[4] && 
       displayExOh[0] == displayExOh[8] &&
       displayExOh[0] !=''){
       _showWinDialog(displayExOh[0]);
    }
    
    

  }
  Void _showWinDialog(String winner){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Winner is '+ winner),);
      }

    );

  }
}
