
enum Routes {
  login(label: "/login"),
  register(label: "/register"),
  addGoal(label: "/goals/new/:userId"),
  goals(label: "/user/goals/:id"),
  particularGoal(label: "/particular-goal/:id");

  final String label;

  const Routes({required this.label});

  String getParametredRoute(String param) {
    final indexOfDoublePoints = label.indexOf(":");

    if (indexOfDoublePoints == -1) {
      throw Exception("esta no es una ruta con parametros");
    }

    final splittedLabel = label.split(":");
    return "${splittedLabel[0]}$param";

  }
}