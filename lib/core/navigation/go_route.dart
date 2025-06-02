import 'package:go_router/go_router.dart';
import 'package:meta_ahora/goals/presentation/screens/goals_screen.dart';
import 'package:meta_ahora/user/presentation/screen/login_screen.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginScreen()
    ),
    GoRoute(
      path: "/goals/:id",
      builder: (context, state){
        final userId = state.pathParameters["id"];
        return GoalsScreen(userId: userId!);
      }
    ),
  ]
);