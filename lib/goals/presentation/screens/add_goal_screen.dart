import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/goals/presentation/blocs/add_goal_cubit.dart';
import 'package:meta_ahora/share/layout/custom_container.dart';
import 'package:meta_ahora/share/widgets/button.dart';
import 'package:meta_ahora/share/widgets/date_picker.dart';
import 'package:meta_ahora/share/widgets/textfield.dart';

class AddGoalScreen extends StatelessWidget {

  final String userId;
  const AddGoalScreen({
    super.key,
    required this.userId
  });

  @override
  Widget build(BuildContext context) {

    final cubit = context.watch<AddGoalCubit>();

    return CustomContainer(
          body: Column(
            children: [
              CustomTextField(
                onChanged: cubit.updateTitle, 
                text: "Titulo",
                spacerHeight: 30,
              ),
              CustomTextField(
                onChanged: cubit.updateDescription,
                text: "Descripcion",
                lines: 5,
                spacerHeight: 30,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Color(ButtonColors.lightGray.color),),
                  SizedBox(width: 20),
                  Expanded(
                    child: DatePickerField(
                      label: "fin de la meta", 
                      onDateSelected: cubit.updateEndDate
                    ),
                  )
                ], 
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    onPressed: cubit.incrementPoints, 
                    text: "",
                    icon: Icons.add,
                    width: null,
                  ),
                  Column(
                    children: [
                      Text(
                        cubit.state.points.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          color: Color(ButtonColors.primary.color)
                        ),
                      ),
                      Text(
                        "pts.", 
                        style: TextStyle(
                          color: Color(ButtonColors.lightGray.color)
                        )
                      )
                    ],
                  ),
                  CustomButton(
                    onPressed: cubit.decrementPoints, 
                    text: "",
                    icon: Icons.horizontal_rule,
                    width: null,
                  )
                ],
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () => cubit.registerGoal(userId, context), 
                text: "Guardar"
              )
            ],
          ),
      );
  }
}