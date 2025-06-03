import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/goals/presentation/screens/add_goal_screen.dart';
import 'package:meta_ahora/goals/presentation/screens/goals_screen.dart';
import 'package:meta_ahora/goals/presentation/screens/particular_goal_screen.dart';
import 'package:meta_ahora/user/presentation/screen/login_screen.dart';
import 'package:meta_ahora/user/presentation/screen/register_screen.dart';

GoRouter goRouter = GoRouter(
  initialLocation: Routes.login.label,
  routes: [
    GoRoute(
      path: Routes.login.label,
      builder: (context, state) => LoginScreen()
    ),
    GoRoute(
      path: Routes.goals.label,
      builder: (context, state){
        final userId = state.pathParameters["id"];
        return GoalsScreen(userId: userId!);
      }
    ),
    GoRoute(
      path: Routes.addGoal.label,
      builder: (context, state) {
        final userId = state.pathParameters["userId"];
        return AddGoalScreen(userId: userId!);
      },
    ),
    GoRoute(
      path: Routes.register.label,
      builder: (context, state) => RegisterScreen()
    ),
    GoRoute(
      path: Routes.particularGoal.label,
      builder: (context, state) {
        final goalId = state.pathParameters["id"];
        return ParticularGoalScreen(goalId: goalId!);
      }
    ),
    
  ]
);