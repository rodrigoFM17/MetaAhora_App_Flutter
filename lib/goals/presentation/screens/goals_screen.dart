
import 'package:flutter/material.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/goals/presentation/widgets/goal_list.dart';
import 'package:meta_ahora/user/presentation/blocs/login_cubit.dart';

class GoalsScreen extends StatelessWidget{

  final String userId;
  const GoalsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: getNotesAppBar(context: context, showAddButton: true),
      body: GoalList(),
    );
  }
}