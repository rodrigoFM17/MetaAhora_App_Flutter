
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/domain/login_use_case.dart';
import 'package:meta_ahora/user/presentation/blocs/states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginUseCase loginUseCase = LoginUseCase();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginCubit() : super(LoginState.initial());

  updateEmail (String email) {
    emit(state.update(email: email));
  }

  updatePassword(String password) {
    emit(state.update(password: password));
  }

  loginUser(BuildContext context) async {
    final user = await loginUseCase.run(LoginDTO(
      email: _emailController.text, 
      password: _passwordController.text
    ));

    if (user != null) {
      context.go("/");
    } else {
      print("credenciales incorrectas");
    }
  }
}