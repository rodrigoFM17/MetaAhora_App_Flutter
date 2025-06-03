import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/core/navigation/go_route.dart';
import 'package:meta_ahora/goals/presentation/blocs/add_goal_cubit.dart';
import 'package:meta_ahora/goals/presentation/blocs/goals_cubit.dart';
import 'package:meta_ahora/goals/presentation/blocs/particular_goal_cubit.dart';
import 'package:meta_ahora/user/presentation/blocs/login_cubit.dart';
import 'package:meta_ahora/user/presentation/blocs/register_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit()
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit()
        ),
        BlocProvider<GoalsCubit>(
          create: (context) => GoalsCubit()
        ),
        BlocProvider(
          create: (context) => ParticularGoalCubit()
        ),
        BlocProvider(
          create: (context) => AddGoalCubit()
        )
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'METAhora',
    );
  }
}
