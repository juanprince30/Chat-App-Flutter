import 'package:chat_app/outils/sms_telephony.dart';
import 'package:chat_app/vues/identity.dart';
import 'package:chat_app/vues/new_page.dart';
import 'package:chat_app/vues/phone_entry.dart';
import 'package:flutter/material.dart';
import 'vues/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SmsTelephony.createTelephonyInstance();
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
        "/phone_entry": (context) => PhoneEntry(),
        "/identity": (context) => Identity(),
        "/new_page": (context) => NewPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
