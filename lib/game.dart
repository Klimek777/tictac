import 'dart:io';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Key? animateKey = ValueKey(0);
  bool iswinner = false;
  int tapcount = 0;
  String resultDeclaration = '';
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  "TIC TAC TOE GAME",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (resultDeclaration == '')
              Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                          setState(() {
                            tapcount++;
                          });
                          if (tapcount == 9 && iswinner != true) {
                            resultDeclaration = 'No one wines';
                          }
                          print(tapcount);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 5, color: Colors.white),
                          ),
                          child: Center(
                              child: AnimatedSwitcher(
                            switchInCurve: Curves.easeIn,
                            duration: Duration(seconds: 1),
                            child: Text(
                              displayXO[index],
                              key: animateKey,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                            ),
                          )),
                        ),
                      );
                    }),
              )
            else
              Expanded(
                child: Text(
                  resultDeclaration,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            TextButton(
                onPressed: () {
                  setState(() {
                    displayXO = ['', '', '', '', '', '', '', '', ''];
                    resultDeclaration = '';
                    iswinner = false;
                    tapcount = 0;
                  });
                },
                child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellowAccent,
                    ),
                    child: Center(
                        child: Text(
                      'Reset',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ))))
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        animateKey = ValueKey(1);
      } else {
        animateKey = ValueKey(2);
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check the row 1
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        iswinner = true;
      });
    }
    //check the row 2
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' Wins!';
        iswinner = true;
      });
    }
    //check the row 3
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins!';
        iswinner = true;
      });
    }
    //check the column 1
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        iswinner = true;
      });
    }
    //check the column 2
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins!';
        iswinner = true;
      });
    }
    //check the column 3
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        iswinner = true;
      });
    }

    //check the cross 1
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        iswinner = true;
      });
    }
    //check the cross 2
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        iswinner = true;
      });
    }
  }
}
