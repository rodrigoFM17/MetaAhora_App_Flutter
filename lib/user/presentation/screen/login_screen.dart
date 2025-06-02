
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/share/widgets/textfield.dart';
import 'package:meta_ahora/user/data/model/loginDTO.dart';
import 'package:meta_ahora/user/data/repository/user_repository.dart';
import 'package:meta_ahora/user/presentation/blocs/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userRepository = UserRepository();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final loginCubit = context.watch<LoginCubit>();

    return Scaffold(
      appBar: getNotesAppBar(context: context),
      backgroundColor: Color(0xFF232323),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: loginCubit.updateEmail,
              text: "Correo Electronico"
            ),
            SizedBox(height: 30),
            CustomTextField(
              onChanged: loginCubit.updatePassword,
              text: "Contraseña"
            ),
            SizedBox(height: 10),
            Text(
              "Aun no tienes cuenta? Registrate aqui",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF068D9C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                onPressed:() {
                  loginCubit.loginUser(context);
                },
                child: Text(
                  "Iniciar Sesion", 
                  style: TextStyle(color: Colors.white)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}