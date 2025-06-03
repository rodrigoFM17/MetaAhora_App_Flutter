import 'package:flutter/material.dart';

enum ButtonColors {
  primary(color: 0xFF068D9C, iconColor: 0xFFFFFFFF),
  secondary(color: 0xFF232323, iconColor: 0xFFB6B6B6),
  terciary(color: 0xFF3C3C3C, iconColor: 0xFF9B9B9B),
  lightGray(color: 0xFF898989, iconColor: 0xFFFFFFFF);


  final int color;
  final int iconColor;

  const ButtonColors({required this.color, required this.iconColor});
}

class CustomButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;
  final ButtonColors color;
  final IconData? icon;
  final double? spacerHeight;
  final double? width;

  const CustomButton({
    super.key, 
    required this.onPressed, 
    required this.text,
    this.color = ButtonColors.primary,
    this.icon,
    this.spacerHeight,
    this.width = double.infinity
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(color.color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: icon != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                Text(
                  text, 
                  style: TextStyle(color: Color(color.iconColor))
                ),
                if ( icon != null) ...[Icon(icon, color: Color(color.iconColor),)]
              ],
            )
          ),
          if(spacerHeight != null) 
            SizedBox(height: spacerHeight)
        ],
      ),
    );
  }
}