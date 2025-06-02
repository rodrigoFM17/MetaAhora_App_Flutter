
enum Routes {
  login(label: "/login"),
  register(label: "/register"),
  addGoal(label: "/goals/new"),
  goals(label: "/user/goals/:id"),
  particularGoal(label: "user/particular-goal/:id");

  final String label;

  const Routes({required this.label});

  String getParametredRoute(List<String> params) {
    final indexOfDoublePoints = label.indexOf(":");

    if (indexOfDoublePoints == -1) {
      throw Exception("esta no es una ruta con parametros");
    }

    var route = label;
    var finalRoute = "";
    params.forEach((param) {
      final splittedRoute = route.split(":");
      route = splittedRoute[1].split("/")[1];
      finalRoute = "${splittedRoute[0]}$param$finalRoute";

    });

    // final splittedLabel = label.split(":");
    // return "${splittedLabel[0]}$param";

    var lastIndexOfParameter = label.length;

    for (int i = indexOfDoublePoints; i < label.length; i++ ){ 
      if(label[i] == "/") {
        lastIndexOfParameter = i;
        break;
      }
    }

    final splittedLabel = label.split(":");
    final indexOfSlash = splittedLabel[1].indexOf("/");

    if( indexOfSlash == -1) {
      return "${splittedLabel[0]}$param";
    } else {
      final restOfLabel = label.substring(indexOfSlash);
      return "${splittedLabel[0]}${getParametredRoute(restOfLabel)}";
    }
    final restOfString = splittedLabel[1].substring()

    final newStr = label.substring(indexOfDoublePoints, lastIndexOfParameter);
  }


}