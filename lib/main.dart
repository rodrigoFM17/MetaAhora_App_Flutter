import 'package:flutter/material.dart';
import 'package:meta_ahora/notes/presentation/screens/add_notes_screen.dart';
import 'package:meta_ahora/notes/presentation/screens/notes_screen.dart';
import 'package:meta_ahora/user/presentation/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'METAhora',
      initialRoute: "/login",
      routes: {
        // "/": (context) => NotesScreen(),
        "/login" : (context) => LoginScreen(),
        // "/notes/add" : (context) => AddNotesScreen()
      },
    );
  }
}
