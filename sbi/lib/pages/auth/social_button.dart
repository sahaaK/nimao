import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'pallete.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
