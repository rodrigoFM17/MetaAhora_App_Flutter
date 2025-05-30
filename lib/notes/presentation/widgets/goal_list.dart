import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/notes/presentation/blocs/goals_cubit.dart';
import 'package:meta_ahora/notes/presentation/widgets/goal_card.dart';

class GoalList extends StatelessWidget {
  const GoalList({super.key});


  @override
  Widget build(BuildContext context) {

    final goalsCubit = context.watch<GoalsCubit>();

    return goalsCubit.state != null ? 
      ListView.builder(
        itemCount: goalsCubit.state?.length ?? 0,
        itemBuilder: (context, index) {
          final goal = goalsCubit.state![index];

          return GoalCard(goal: goal);
        },
      )
      : 
      Text("no se pudo obtener las metas");
  }
}