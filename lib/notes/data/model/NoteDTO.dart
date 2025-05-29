
import 'dart:ffi';

class NoteDTO {

  final String id;
  final String title;
  final String description;
  final String state;
  final int points;
  final Long endDate;

  NoteDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.state,
    required this.endDate
  });

}