import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web3/ethers.dart';

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
                child: Text(
                  'rock',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.blue)
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
                child:  const Text(
                    'paper',
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.blue)
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
                child: const Text(
                    'scissors',
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.blue)
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _result,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                // Reset the game
                _userChoice = "";
                _computerChoice = "";
                _result = "";
              });
            },
            child: const Text(
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
    runcontract();




  }}

void runcontract()async{
  var contract = Contract(ABI, "0xd9145CCE52D386f254917e481eB44e9943F39138", "http://127.0.0.1:8545");
  var result = await contract.call('getResult');
  print(result);
}

const ABI = '''{
	"compiler": {
		"version": "0.8.18+commit.87f61d96"
	},
	"language": "Solidity",
	"output": {
		"abi": [
			{
				"anonymous": false,
				"inputs": [
					{
						"indexed": false,
						"internalType": "address",
						"name": "player",
						"type": "address"
					},
					{
						"indexed": false,
						"internalType": "enum RockPaperScissors.Choice",
						"name": "playerChoice",
						"type": "uint8"
					},
					{
						"indexed": false,
						"internalType": "enum RockPaperScissors.Choice",
						"name": "computerChoice",
						"type": "uint8"
					},
					{
						"indexed": false,
						"internalType": "enum RockPaperScissors.Result",
						"name": "result",
						"type": "uint8"
					}
				],
				"name": "GameResult",
				"type": "event"
			},
			{
				"inputs": [],
				"name": "getResult",
				"outputs": [
					{
						"internalType": "enum RockPaperScissors.Choice",
						"name": "",
						"type": "uint8"
					},
					{
						"internalType": "enum RockPaperScissors.Choice",
						"name": "",
						"type": "uint8"
					},
					{
						"internalType": "enum RockPaperScissors.Result",
						"name": "",
						"type": "uint8"
					}
				],
				"stateMutability": "view",
				"type": "function"
			},
			{
				"inputs": [
					{
						"internalType": "enum RockPaperScissors.Choice",
						"name": "_playerChoice",
						"type": "uint8"
					}
				],
				"name": "play",
				"outputs": [],
				"stateMutability": "nonpayable",
				"type": "function"
			}
		],
		"devdoc": {
			"custom:dev-run-script": "contracts/1_Storage.sol",
			"details": "ContractDescription",
			"kind": "dev",
			"methods": {},
			"title": "RockPaperScissors",
			"version": 1
		},
		"userdoc": {
			"kind": "user",
			"methods": {},
			"version": 1
		}
	},
	"settings": {
		"compilationTarget": {
			"contracts/1_Storage.sol": "RockPaperScissors"
		},
		"evmVersion": "paris",
		"libraries": {},
		"metadata": {
			"bytecodeHash": "ipfs"
		},
		"optimizer": {
			"enabled": false,
			"runs": 200
		},
		"remappings": []
	},
	"sources": {
		"contracts/1_Storage.sol": {
			"keccak256": "0x69578980a341e5648d3affd4274e2a573ca7fba453e36c162a949fe25d9003af",
			"urls": [
				"bzz-raw://20bdcdbe4c6999335cafafea3d385c5c1254af1c159473a9b4d5c31bf61e6043",
				"dweb:/ipfs/QmTyc2wp4sp4JAkC1JT632g9ZdKFFVzexrKoUHBibAduWY"
			]
		}
	},
	"version": 1
}''';