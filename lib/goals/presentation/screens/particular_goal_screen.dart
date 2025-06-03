import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta_ahora/goals/presentation/blocs/particular_goal_cubit.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/share/widgets/button.dart';

class ParticularGoalScreen extends StatefulWidget {

  final String goalId;
  const ParticularGoalScreen({super.key, required this.goalId});

  @override
  State<ParticularGoalScreen> createState() => _ParticularGoalScreenState();
}

class _ParticularGoalScreenState extends State<ParticularGoalScreen> {

  @override
  void initState() {
    super.initState();
    final particularCubit = context.read<ParticularGoalCubit>();
    particularCubit.getParticularGoal(widget.goalId);
  }

  @override
  Widget build(BuildContext context) {

    var cubit = context.watch<ParticularGoalCubit>();
    var goal = cubit.state;
    final format = DateFormat("dd/MM/yy");

    return Scaffold(
      appBar: getNotesAppBar(context: context),
      backgroundColor: Color(0xFF2C2C2C),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cubit.state == null ? [  Text("No fue posible obtener esta meta") ] : [
            Text(
              cubit.state!.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              )),
            SizedBox(height: 20),
            Text(
              cubit.state!.points.toString(), 
              style: TextStyle(
                fontSize: 100,
                color: Color(ButtonColors.primary.color)
              ),
            ),
            Text(
              "pts.",
              style: TextStyle(
                color: Color(ButtonColors.lightGray.color),
                fontSize: 15,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 30),
            Text(
              cubit.state!.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              )),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(cubit.state!.state.color),
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  cubit.state!.state.label,
                  style: TextStyle(
                    color: Color(ButtonColors.lightGray.color)
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.calendar_month, 
                  color: Color(ButtonColors.lightGray.color)
                ),
                SizedBox(width: 10),
                Text(
                  cubit.state?.endDate != null ? format.format(DateTime.fromMillisecondsSinceEpoch(cubit.state!.endDate!)) : "meta sin fecha limite",
                  style: TextStyle(color: Color(ButtonColors.lightGray.color)),
                )
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () => cubit.deleteGoal(widget.goalId),
              text: "Marcar como fallido",
              icon: Icons.cancel,
              color: ButtonColors.secondary,
              spacerHeight: 20,
            ),
            CustomButton(
              onPressed: () => cubit.deleteGoal(widget.goalId), 
              text: "Marcar como completado",
              icon: Icons.check_circle,
              spacerHeight: 20,
            ),
            CustomButton(
              onPressed: () => cubit.deleteGoal(widget.goalId), 
              text: "Eliminar meta",
              icon: Icons.delete,
              color: ButtonColors.terciary,
              spacerHeight: 20,
            )

          ],
        ),
      ),
    );
  }
}