import 'package:flutter/material.dart';
import 'phone_entry.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff0F1828),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 140),
            Image.asset("assets/images/Illustration.png"),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 20, 0),
              child: Center(
                child: Text(
                  "Connect easily with your family and friends over countries",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/phone_entry");
          },
          backgroundColor: const Color.fromARGB(255, 58, 94, 183),
          child: const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
