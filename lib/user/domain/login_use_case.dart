import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';
import 'package:meta_ahora/user/data/repository/user_repository.dart';

class LoginUseCase {

  final IUserRepository repository = UserRepository();

  Future<UserDTO?> run(LoginDTO credentials) async {

    try {
      return await repository.login(credentials);
    }catch (e) {
      print(e);
      return null;
    }
  }
}