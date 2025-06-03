import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta_ahora/goals/presentation/blocs/particular_goal_cubit.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/share/widgets/button.dart';

class ParticularGoalScreen extends StatelessWidget {

  final String goalId;
  const ParticularGoalScreen({super.key, required this.goalId});

  @override
  Widget build(BuildContext context) {

    final particularGoalCubit = context.watch<ParticularGoalCubit>();
    var goal = particularGoalCubit.state;
    final format = DateFormat("dd/MM/yy");

    return Scaffold(
      appBar: getNotesAppBar(context: context),
      backgroundColor: Color(0xFF232323),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: particularGoalCubit.state == null ? [  Text("No fue posible obtener esta meta") ] : [
            Text(goal!.title),
            SizedBox(height: 20),
            Text(
              goal.points.toString(), 
              style: TextStyle(
                fontSize: 50
              ),
            ),
            Text("pts."),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(goal.state.color),
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(width: 10),
                Text(goal.state.label)
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 10),
                Text(format.format(DateTime.fromMillisecondsSinceEpoch(goal.endDate)))
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () => particularGoalCubit.deleteGoal(goal.id), 
              text: "Eliminar meta",
              icon: Icons.delete,
            )

          ],
        ),
      ),
    );
  }
}