import 'package:flutter/material.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';

class GoalCard extends StatelessWidget {

  final GoalDTO goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                // indicador de estado
                Text(
                  goal.title,
                  style: TextStyle(color: Color(0xFF068D9C)),
                ),
              ],
            ),
            Text(
              goal.description,
              style: TextStyle(color: Color(0xFF898989)),
            )
          ],
        ),
      ),
    );
  }
}