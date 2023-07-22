import 'package:flutter/material.dart';

import '../resuorces/colors.dart';

class WButton extends StatelessWidget {
  final Image icon;
  final GestureTapCallback onTap;
  const WButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 143,
        height: 143,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: AppColors.shadow),
          ],
        ),
        child: icon,
      ),
    );
  }
}
