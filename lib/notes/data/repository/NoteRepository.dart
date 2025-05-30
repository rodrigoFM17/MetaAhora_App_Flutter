
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_ahora/notes/data/datasource/INoteRepository.dart';
import 'package:meta_ahora/notes/data/model/GoalDTO.dart';
import 'package:meta_ahora/share/model/api_response.dart';

class NoteRepository implements INoteRepository {

  @override
  Future<List<GoalDTO>?> getAll(String userId) async {
    
    Dio dio = Dio();

    try {

      final res = await dio.get("localhost:3000/goals/$userId");
      final apiRes = APIResponse.fromJson(res.data);

      if(apiRes.data == null) {
        return null;
      }

      List<GoalDTO> goals = [];

      jsonDecode(apiRes.data).forEach((goal) => {
        goals.add(GoalDTO.fromJson(goal))
      });

      return goals;
    } catch (e) {

      print(e);
      return null;
    }
   }
  
}