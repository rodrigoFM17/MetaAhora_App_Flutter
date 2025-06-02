
import 'package:meta_ahora/user/data/datasource/iuser_repository.dart';
import 'package:meta_ahora/user/data/model/register_DTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';
import 'package:meta_ahora/user/data/repository/user_repository.dart';

class RegisterUseCase {

  final IUserRepository repository = UserRepository();

  Future<UserDTO?> run(RegisterDTO newUser) async {

    try {
      return await repository.register(newUser);
    }catch (e) {
      print(e);
      return null;
    }
  }
}