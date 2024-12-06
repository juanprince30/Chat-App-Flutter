import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          // Page 1
          Container(
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
          // Page 2
          Container(
            color: const Color(0xff0F1828),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 200, 50, 0),
                  child: Center(
                    child: Text(
                      "Entrez votre numéro de téléphone",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Text(
                          "+226",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Entrez votre numéro",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action à effectuer
                      print("Numéro de téléphone soumis");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Continuer",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
