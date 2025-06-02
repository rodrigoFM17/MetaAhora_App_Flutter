
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/user/data/model/register_DTO.dart';
import 'package:meta_ahora/user/domain/register_use_case.dart';
import 'package:meta_ahora/user/presentation/blocs/states/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  final registerUseCase = RegisterUseCase();

  RegisterCubit() : super(RegisterState.initial());

  updateEmail (String email) {
    emit(state.update(email: email));
  }

  updatePassword(String password) {
    emit(state.update(password: password));
  }

  updateNickname(String nickname) {
    emit(state.update(nickname: nickname));
  }

  registerUser(BuildContext context) async {
    final user = await registerUseCase.run(RegisterDTO(
      nickname: state.nickname, 
      email: state.email, 
      password: state.password
    ));

    if(user != null) {
      context.go(Routes.login.label);
    } else {
      print("no se pudo registrar el nuevo usuario");
    }
  }
}