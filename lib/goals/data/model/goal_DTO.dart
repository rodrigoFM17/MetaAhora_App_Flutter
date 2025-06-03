import 'dart:ffi';

enum State {
  completed("completado", 0xFF12D800),
  pending("pendiente", 0xFFFFE205),
  failed("fallido", 0xFFE00000);

  final String label;
  final int color;

  const State(this.label, this.color);
}



class GoalDTO {

  final String id;
  final String title;
  final String description;
  final State state;
  final int points;
  final int? endDate;

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
      points: json["points"],
      state: json["state_id"] == 1 ? State.completed : json["state_id"] == 2 ? State.pending : State.failed,
      title: json["title"] ,
      endDate: json["end_date"]
    );
  }



}