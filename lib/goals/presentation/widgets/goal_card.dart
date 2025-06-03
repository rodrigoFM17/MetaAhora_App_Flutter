import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';

class GoalCard extends StatelessWidget {

  final GoalDTO goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.particularGoal.getParametredRoute(goal.id)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              goal.title,
              style: TextStyle(
                color: Color(0xFF068D9C),
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            Text(
              goal.description,
              style: TextStyle(
                color: Color(0xFF898989),
                fontSize: 20
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}