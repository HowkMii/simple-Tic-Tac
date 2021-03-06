
import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; 
  List<String>  displayExOh =['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',];
  var myTextStyle = TextStyle(color: Colors.white,fontSize: 20);
  int ohScore =0;
  int exScore = 0;
  int filledBoxes = 0;
   static var myNewFont = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 20));
    
    static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 10));
  

  
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child:Container(
              
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,

                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(top:100.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('Player K \n\n',style: myNewFontWhite,),
                         
                         Text(ohScore.toString(),style: myNewFont,),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top:100.0,left: 10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('Player H \n\n',style: myNewFontWhite,),
                         Text(exScore.toString(),style: myNewFont,),
                       ],
                     ),
                   ),
                 ],

               ),
            ) ,


            
            ),
          Expanded(
            flex: 3,
                      child: GridView.builder(
              itemCount: 36,
              gridDelegate:
               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
                itemBuilder: (BuildContext contex,int index){
                  return GestureDetector(
                    onTap:(){_tapped(index);
                    },

                    
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all( color: Colors.grey[700])
                      ),
                      child: Center(
                        child: Text(displayExOh[index],style: TextStyle(color: Colors.white,fontSize: 20),),),
                    ),
                  );
                }),
          ),
          Expanded(
            child:Container(
              child: Center(child: Column(children: <Widget>[
                Text('TIC TAC TOE',style: myNewFontWhite),
                    SizedBox(height: 5,),
                 Text(' By HowkMii', style: myNewFontWhite),
              ],),),

            ) ,
            

            
            ),
        ],
      ),
     
  
    );
   
  }
  void _tapped( int index){
    
    setState(() {
      if(ohTurn && displayExOh[index] ==''){
        displayExOh[index] ='X';
        filledBoxes += 1;

      }else if(!ohTurn && displayExOh[index] ==''){
        displayExOh[index] ='O';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });

    
  }
  // ignore: missing_return
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
  else if(filledBoxes == 9){
    _showDrawDialog();
  }
    
    

  }
  // ignore: missing_return
  Void _showDrawDialog(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Draw'),
          actions: <Widget>[
            FlatButton(
              child: Text('Play Again'),
              onPressed:(){
                _clearBoard();
                Navigator.of(context).pop();
              } )
          ],
          );
      }

    );
    
    }
  // ignore: missing_return
  Void _showWinDialog(String winner){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Winner is '+ winner),
          actions: <Widget>[
            FlatButton(
              child: Text('Play Again'),
              onPressed:(){
                _clearBoard();
                Navigator.of(context).pop();
              } )
          ],
          );
      }

    );
    if (winner == 'X'){
      ohScore = ohScore +=1;

    }else if(winner == 'O'){
      exScore = exScore +=1;

    }
    }
    void _clearBoard(){
      setState(() {
        for(int i=0; i<36;i++){

        displayExOh[i]='';
      }
        
      });
      filledBoxes = 0;
      

  }
}
