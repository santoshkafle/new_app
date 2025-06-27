import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String buttonText;
  final bool isSmall;
  final TextStyle textStyle;

  const WhiteButton({
    super.key,
    required this.buttonText,
    required this.textStyle,
    this.isSmall = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: isSmall ? 40 : null,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(buttonText, style: textStyle),
    );
  }
}
