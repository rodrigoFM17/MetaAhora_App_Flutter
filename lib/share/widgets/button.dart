import 'package:flutter/material.dart';

enum ButtonColors {
  primary(color: 0xFF068D9C),
  secondary(color: 0xFF232323),
  terciary(color: 0xFF3C3C3C);

  final int color;

  const ButtonColors({required this.color});
}

class CustomButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;
  final ButtonColors color;
  final IconData? icon;

  const CustomButton({
    super.key, 
    required this.onPressed, 
    required this.text,
    this.color = ButtonColors.primary,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
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
              style: TextStyle(color: Colors.white)
            ),
            if ( icon != null) ...[Icon(icon)]
          ],
        )
      ),
    );
  }
}