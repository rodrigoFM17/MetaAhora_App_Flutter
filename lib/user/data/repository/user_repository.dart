
import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';

class UserRepository implements IUserRepository {

  @override
  Future<UserDTO?> login(LoginDTO credentials) {
    // TODO: implement login
    throw UnimplementedError();
  }
}