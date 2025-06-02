
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/model/register_DTO.dart';
import 'package:meta_ahora/user/data/model/userDTO.dart';

abstract class IUserRepository {

  Future<UserDTO?> login(LoginDTO credentials);
  Future<UserDTO?> register(RegisterDTO newUser);

}