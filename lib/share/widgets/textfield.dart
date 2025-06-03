
import 'package:flutter/material.dart';

getTextField({
  required TextEditingController controller,
  required String text
}) {
  return TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.white
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFF535353),
      labelStyle: TextStyle(color: Color(0xFFB6B6B6)),
      labelText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none
      )
    ) 
  );
}


class CustomTextField extends StatelessWidget {

  final String text;
  final void Function(String) onChanged;
  final int? lines;
  final double? spacerHeight;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.text,
    this.lines,
    this.spacerHeight
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: lines,
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF535353),
            labelStyle: TextStyle(color: Color(0xFFB6B6B6)),
            labelText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none
            )
          ) 
        ),
        if(spacerHeight != null) 
          SizedBox(height: spacerHeight)
      ],
    );
  }
}