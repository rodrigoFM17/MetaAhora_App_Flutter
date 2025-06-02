import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;

  const CustomButton({
    super.key, 
    required this.onPressed, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF068D9C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        onPressed: onPressed,
        child: Text(
          text, 
          style: TextStyle(color: Colors.white)
        )
      ),
    );
  }
}