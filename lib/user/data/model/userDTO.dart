
class UserDTO {

  final String id;
  final String nickname;
  final String email;
  final String password;

  UserDTO({
    required this.id,
    required this.nickname,
    required this.email,
    required this.password
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json["id"], 
      nickname: json["nickname"], 
      email: json["email"], 
      password: json["password"]
    );
  }
  
}