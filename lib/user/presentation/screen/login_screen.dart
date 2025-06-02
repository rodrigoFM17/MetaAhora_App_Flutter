
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/share/widgets/button.dart';
import 'package:meta_ahora/share/widgets/textfield.dart';
import 'package:meta_ahora/user/presentation/blocs/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            GestureDetector(
              onTap: () => context.go(Routes.register.label),
              child: Text(
                "Aun no tienes cuenta? Registrate aqui",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            CustomButton(onPressed: () => loginCubit.loginUser(context), text: "Iniciar sesion")
          ],
        ),
      ),
    );
  }
}