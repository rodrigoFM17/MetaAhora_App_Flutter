
class AddGoalState {

  final String title;
  final String description;
  final int? endDate;
  final int points;

  AddGoalState({
    required this.title,
    required this.description,
    required this.points,
    this.endDate
  });

  factory AddGoalState.initial() => AddGoalState(
    title: "",
    description: "",
    points: 1,
  );

  AddGoalState update({String? title, String? description, int? endDate, int? points}) {
    return AddGoalState(
      title: title ?? this.title,
      description: description ?? this.description,
      points: points ?? this.points,
      endDate: endDate ?? this.endDate
    );
  }
}