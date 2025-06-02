
class RegisterState {

  final String nickname;
  final String email;
  final String password;

  RegisterState({
    required this.nickname,
    required this.email,
    required this.password
  });

  factory RegisterState.initial() => RegisterState(
    email: '',
    password: '',
    nickname: ""
  );

  RegisterState update({String? email, String? password, String? nickname}) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      nickname: nickname ?? this.nickname
    );
  }

}