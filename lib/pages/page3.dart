import 'package:chat_app/Pages/MainPage.dart';
import 'package:chat_app/Pages/page4.dart';
import 'package:chat_app/Tools/color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Page3 extends StatefulWidget {
  final String tel;
  const Page3({required this.tel,super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[700]!),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: blueOurColor),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[700]!),
      ),
    );

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Entrer le Code',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nous vous avons envoyer un SMS avec le code a votre Numero de Telephone.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Pinput(
              controller: _codeController,
              length: 5,
              obscureText: true,

              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              showCursor: true,
              cursor: Container(
                height: 25,
                width: 2,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Resend code functionality
                print('Resend code pressed');
              },
              child: Text(
                'Renvoyer le Code',
                style: TextStyle(color: blueOurColor, fontSize: 16),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle code verification
                print('Code entered: ${_codeController.text}');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>  Page4(tel: widget.tel)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueOurColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
              ),
              child: const Text(
                'Verifier',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
