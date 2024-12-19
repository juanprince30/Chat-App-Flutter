import 'package:flutter/material.dart';


class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: const Color(0xff0F1828),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.4),
            Image.asset("assets/images/Illustration.png"),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.1, screenWidth * 0.1, screenWidth * 0.08, 0),
              child: Center(
                child: Text(
                  "Connect easily with your family and friends over countries",
                  style: TextStyle(
                      fontSize: screenWidth * 0.07,
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
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/phone_entry");
          },
          backgroundColor: const Color.fromARGB(255, 58, 94, 183),
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            size: screenWidth * 0.08,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
