
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';

abstract class IUserRepository {

  Future<UserDTO?> login(LoginDTO credentials);

}