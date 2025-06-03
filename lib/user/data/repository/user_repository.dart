
import 'dart:convert';

import 'package:meta_ahora/core/network/dio_client.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/share/model/api_response.dart';
import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/register_DTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';

class UserRepository implements IUserRepository {

  final dio = DioClient.instance.dio;

  @override
  Future<UserDTO?> login(LoginDTO credentials) async {
    try {
      
      final res = await dio.post(
        "/users/auth", 
        data: {
          "email": credentials.email,
          "password": credentials.password
        }
      );

      final jsonRes = jsonDecode(jsonEncode(res.data));

      final apiRes = APIResponse<List<UserDTO>>.fromJson(jsonRes, (data) => (data as List).map((user) => UserDTO.fromJson(user)).toList());
      print(apiRes);
      print("data: ${apiRes.data}");
      return apiRes.data![0];

      // final json = jsonDecode(res.data.jsify());

      // print("json decoded: $json");

      // final apiRes = APIResponse.fromJson(res.data);

      // print("jsondecode $json");

      // if (apiRes.data == null) {
      //   return null;
      // }
      
      // final user = UserDTO.fromJson(apiRes.data[0]);
      // print(user);
      // return user;

    } catch (e) {
      print("error en repositorio usuario");
      print(e);

      return null;
    }
  }

  @override
  Future<UserDTO?> register(RegisterDTO newUser) async {
    try {

      final res = await dio.post(
        "/users",
        data: {
          "email" : newUser.email,
          "nickname": newUser.nickname,
          "password" : newUser.password
        }
      );

      final apiRes = jsonDecode(res.data) as APIResponse<List<UserDTO>?>;
      print(apiRes);
      if(apiRes.data == null) {
        return null;
      }
      final user = apiRes.data![0];
      print("usuario: $user");
      return user;

    } catch (e) {
      print(e);
      return null;
    }
  }
}