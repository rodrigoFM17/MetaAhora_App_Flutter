import 'package:meta_ahora/core/network/dio_client.dart';
import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';
import 'package:meta_ahora/goals/data/model/new_goal_DTO.dart';

class GoalRepository implements IGoalRepository {

  @override
  Future<List<GoalDTO>?> getAll(String userId) async {

    final apiRes = await DioClient.get<List<GoalDTO>>(
      path: "/users/$userId/goals",
      fromJsonT: (data) => (data as List).map((goalJson) => GoalDTO.fromJson(goalJson)).toList()
    );

    return apiRes?.data;
    
   }

  @override
  Future<GoalDTO?> getParticular(String goalId) async {

    final apiRes = await DioClient.get<List<GoalDTO>>(
      path: "/goals/$goalId", 
      fromJsonT: (data) => (data as List).map((goalJson) => GoalDTO.fromJson(goalJson)).toList()
    );

    return apiRes?.data?[0];
  }

  @override
  Future<GoalDTO?> register(NewGoalDTO newGoal) async {
    final apiRes = await DioClient.post(
      path: "/goals", 
      body: {
        "userId": newGoal.userId,
        "title": newGoal.title,
        "description": newGoal.description,
        "end_date": newGoal.endDate,
        "points": newGoal.points
      }, 
      fromJsonT: (data) => (data as List).map((goalJson) => GoalDTO.fromJson(goalJson)).toList()
    );

    return apiRes?.data?[0];
  }
  
}