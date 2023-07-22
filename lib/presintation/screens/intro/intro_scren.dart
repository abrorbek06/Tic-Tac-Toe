import 'package:dars_01/presintation/resuorces/colors.dart';
import 'package:dars_01/presintation/screens/game/game.dart';
import 'package:dars_01/presintation/widgets/w_back.dart';
import 'package:dars_01/presintation/widgets/w_button.dart';
import 'package:dars_01/presintation/widgets/w_title.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WBack(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: width,
                  height: 420,
                  child: Image.asset(
                    "assets/back.png",
                  ),
                ),
                const Center(
                  child: WTitle(title: "TIC-TAC-TOE"),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Text(
                  "Pick who goes first?",
                  style: TextStyle(color: AppColors.white, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WButton(
                  icon: Image.asset("../assets/cross.png"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const GameScreen(
                          currentPlayer: "x",
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 25,
                ),
                WButton(
                  icon: Image.asset("../assets/circle.png"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const GameScreen(
                          currentPlayer: "0",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
