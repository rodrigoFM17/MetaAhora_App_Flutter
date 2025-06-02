
class LoginState {

  final String email;
  final String password;

  LoginState({
    required this.email,
    required this.password,
  });

  factory LoginState.initial() => LoginState(
    email: '',
    password: '',
  );

  LoginState update({String? email, String? password}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}