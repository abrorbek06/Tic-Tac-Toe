import 'package:dars_01/presintation/resuorces/colors.dart';
import 'package:dars_01/presintation/screens/intro/intro_scren.dart';
import 'package:dars_01/presintation/widgets/w_back.dart';
import 'package:dars_01/presintation/widgets/w_title.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String currentPlayer;
  const GameScreen({super.key, required this.currentPlayer});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _board = [];
  String _currentPlayer = "";
  String winner = "";

  @override
  void initState() {
    _board = List.filled(9, '');
    _currentPlayer = widget.currentPlayer;
    super.initState();
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'x' ? '0' : 'x';
  }

  void _chekWinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var line in lines) {
      var a = _board[line[0]];
      var b = _board[line[1]];
      var c = _board[line[2]];

      if (a == b && b == c && a != '') {
        winner = a;
        break;
      }
    }

    if (winner == '' && !_board.contains('')) {
      winner = "Lose!";
    }
  }

  void _playMove(int index) {
    if (_board[index] == '' && winner == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _switchPlayer();
        _chekWinner();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WBack(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WTitle(
              title:
                  winner == "" ? "Player - $_currentPlayer" : "Winner: $winner",
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 324,
              height: 324,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(color: AppColors.shadow, blurRadius: 10),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.zero,
                  children: List.generate(
                    9,
                    (index) => GestureDetector(
                      onTap: () => _playMove(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.shadow, width: 1),
                        ),
                        child: _board[index] != ''
                            ? Center(
                                child: Image.asset(
                                  _board[index] == '0'
                                      ? '../assets/circle.png'
                                      : '../assets/cross.png',
                                  width: 100,
                                  height: 100,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (winner != "") ...{
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const IntroScreen()),
                    (route) => false,
                  );
                },
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Text(
                    "Reset",
                    style: TextStyle(color: AppColors.white, fontSize: 24),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(12)),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
