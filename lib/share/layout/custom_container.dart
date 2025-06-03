
import 'package:flutter/material.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';

class CustomContainer extends StatelessWidget {

  final bool showButton;
  final Widget body;
  final double? horizontalPaddding;
  final double? verticalPadding;
  const CustomContainer({
    super.key, 
    this.showButton = false, 
    required this.body,
    this.horizontalPaddding,
    this.verticalPadding
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getNotesAppBar(context: context),
      backgroundColor: Color(0xFF2C2C2C),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPaddding ?? 50, vertical: verticalPadding ?? 50),
        child: body,
      ),
    );
  }
}