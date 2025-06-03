
class NewGoalDTO {

  final String userId;
  final String title;
  final String description;
  final int? endDate;
  final int points;

  NewGoalDTO({
    required this.userId,
    required this.title,
    required this.description,
    required this.points,
    this.endDate
  });

  
}