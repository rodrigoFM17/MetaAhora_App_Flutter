
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/share/model/api_response.dart';

class GoalRepository implements IGoalRepository {

  @override
  Future<List<GoalDTO>?> getAll(String userId) async {
    
    Dio dio = Dio();

    try {

      final res = await dio.get("localhost:3000/goals/$userId");
      final apiRes = APIResponse<List<GoalDTO>>.fromJson(res.data, (data) => (data as List).map((goalJson) => GoalDTO.fromJson(goalJson)).toList());

      if(apiRes.data == null) {
        return null;
      }

      List<GoalDTO> goals = [];


      return apiRes.data;
    } catch (e) {

      print(e);
      return null;
    }
   }

  @override
  Future<GoalDTO?> getParticular(String goalId) async {
    Dio dio = Dio();

    try {

      final res = await dio.get("localhost:3000/goals/$goalId");
      final apiRes = APIResponse<List<GoalDTO>>.fromJson(res.data, (data) => (data as List).map((goalJson) => GoalDTO.fromJson(goalJson)).toList());

      if(apiRes.data == null) {
        return null;
      }

      return apiRes.data![0];
    } catch (e) {

      print(e);
      return null;
    }
  }
  
}