import 'package:flutter/material.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/goals/presentation/widgets/goal_card.dart';

class GoalList extends StatelessWidget {

  final List<GoalDTO> goals;

  const GoalList({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];

        return GoalCard(goal: goal);
      },
    );
  }
}