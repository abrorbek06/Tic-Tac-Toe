import 'package:flutter/material.dart';

import '../resuorces/colors.dart';

class WTitle extends StatelessWidget {
  final String title;
  const WTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 42,
        shadows: [
          Shadow(
            color: AppColors.shadow,
            blurRadius: 10.0,
            offset: Offset(10, 10),
          )
        ],
      ),
    );
  }
}
