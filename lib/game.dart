import 'dart:math';

import 'package:flutter/material.dart';

class RockPaperScissorsGame extends StatefulWidget {
  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  // Define variables and functions for the game logic
  String _userChoice = "";
  String _computerChoice = "";
  String _result = "";

  // Define UI elements for the game
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock-Paper-Scissors Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Make your choice:',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _userChoice = "rock";
                    // Call a function to process the game logic
                    _processGame();
                  });
                },
                child: Image.asset(
                  'images/rock.png',
                  width: 100,
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _userChoice = "paper";
                    // Call a function to process the game logic
                    _processGame();
                  });
                },
                child: Image.asset(
                  'images/paper.png',
                  width: 100,
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _userChoice = "scissors";
                    // Call a function to process the game logic
                    _processGame();
                  });
                },
                child: Image.asset(
                  'images/scissors.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            _result,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                // Reset the game
                _userChoice = "";
                _computerChoice = "";
                _result = "";
              });
            },
            child: Text(
              'Play Again',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  // Define a function to process the game logic
  void _processGame() {
    // Generate a random choice for the computer

    var choices = ["rock", "paper", "scissors"];
    _computerChoice = choices[Random().nextInt(choices.length)];

    // Compare the user choice with the computer choice
    if (_userChoice == _computerChoice) {
      _result = "It's a tie!";
    } else if ((_userChoice == "rock" && _computerChoice == "scissors") ||
        (_userChoice == "paper" && _computerChoice == "rock") ||
        (_userChoice == "scissors" && _computerChoice == "paper")) {
      _result = "You Win!";
    } else {
      _result = "You Lose!";
    }
  }}