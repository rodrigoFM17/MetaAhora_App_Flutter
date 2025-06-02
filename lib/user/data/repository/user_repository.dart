
import 'package:meta_ahora/core/network/dio_client.dart';
import 'package:meta_ahora/share/model/api_response.dart';
import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
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
      final apiRes = APIResponse.fromJson(res.data);

      if (apiRes.data == null) {
        return null;
      }
      
      final user = UserDTO.fromJson(apiRes.data);
      print(user);
      return user;

    } catch (e) {
      print(e);
      return null;
    }
  }
}