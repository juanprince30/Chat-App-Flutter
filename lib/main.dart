import 'package:chat_app/vues/identity.dart';
import 'package:flutter/material.dart';
import 'vues/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: "/intro",
      routes: {
        "/intro": (context) => Intro(),
        "/identity": (context) => Identity(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
