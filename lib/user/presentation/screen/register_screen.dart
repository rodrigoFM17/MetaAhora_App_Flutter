
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/share/widgets/button.dart';
import 'package:meta_ahora/share/widgets/textfield.dart';
import 'package:meta_ahora/user/presentation/blocs/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final registerCubit = context.watch<RegisterCubit>();

    return Scaffold(
      appBar: getNotesAppBar(context: context),
      backgroundColor: Color(0xFF232323),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: registerCubit.updateNickname, 
              text: "Nombre de usuario"
            ),
            SizedBox(height: 30),
            CustomTextField(
              onChanged: registerCubit.updateEmail, 
              text: "Correo electronico"
            ),
            SizedBox(height: 30),
            CustomTextField(
              onChanged: registerCubit.updatePassword, 
              text: "Contrasena"
            ),
            SizedBox(height: 30),
            CustomButton(onPressed: () => registerCubit.registerUser(context), text: "Registrarse")
          ],
        ),
      ),
    );
  }
}