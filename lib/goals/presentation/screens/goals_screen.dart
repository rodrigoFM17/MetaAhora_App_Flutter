
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/goals/presentation/blocs/goals_cubit.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/goals/presentation/widgets/goal_list.dart';

class GoalsScreen extends StatefulWidget{

  final String userId;
  const GoalsScreen({super.key, required this.userId});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {

  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {

    GoalsCubit goalsCubit = context.watch<GoalsCubit>();
    goalsCubit.getGoals(widget.userId);

    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: getNotesAppBar(context: context, showAddButton: true),
      body: GoalList(goals: goalsCubit.state ?? []),
    );
  }
}