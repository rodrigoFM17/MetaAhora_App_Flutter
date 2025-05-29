
import 'package:meta_ahora/notes/data/model/NoteDTO.dart';

abstract class INoteRepository {

  Future<List<NoteDTO>?> getAll();

}