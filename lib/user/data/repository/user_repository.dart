import 'package:meta_ahora/core/network/dio_client.dart';
import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/register_DTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';

class UserRepository implements IUserRepository {

  @override
  Future<UserDTO?> login(LoginDTO credentials) async {

    final apiRes = await DioClient.post<List<UserDTO>>(
      path: "/users/auth", 
      body: {
          "email": credentials.email,
          "password": credentials.password
        },
      fromJsonT: (data) => (data as List).map((user) => UserDTO.fromJson(user)).toList()
    );

    final user = apiRes?.data?[0];
    print("usuario obtenido: $user");
    return user;
  }

  @override
  Future<UserDTO?> register(RegisterDTO newUser) async {

    final apiRes = await DioClient.post<List<UserDTO>>(
      path: "/users", 
      body: {
          "email" : newUser.email,
          "nickname": newUser.nickname,
          "password" : newUser.password
        },
      fromJsonT: (data) => (data as List).map((user) => UserDTO.fromJson(user)).toList()
    );

    final user = apiRes?.data?[0];
    print("usuario obtenido: $user");
    return user;
  }
}