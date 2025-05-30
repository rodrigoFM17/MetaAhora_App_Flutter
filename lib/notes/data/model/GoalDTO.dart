import 'dart:ffi';

enum State {
  completed("completado"),
  pending("pendiente"),
  failed("fallido");

  final String label;

  const State(this.label);
}



class GoalDTO {

  final String id;
  final String title;
  final String description;
  final State state;
  final int points;
  final Long endDate;

  GoalDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.state,
    required this.endDate
  });

  factory GoalDTO.fromJson(Map<String, dynamic> json) {
    return GoalDTO(
      id: json["id"],
      description: json["description"],
      endDate: json["endDate"],
      points: json["points"],
      state: json["state"],
      title: json["title"] 
    );
  }



}