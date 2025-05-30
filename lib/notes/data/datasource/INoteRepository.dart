
import 'package:meta_ahora/notes/data/model/GoalDTO.dart';

abstract class INoteRepository {

  Future<List<NoteDTO>?> getAll(String userId);

}