import 'package:chat_app/Pages/page4.dart';
import 'package:chat_app/tools/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: mainColor,
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Entrez votre code",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Vous avez reçu un SMS avec un code sur le numéro +226 54789089",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
                child: Form(
                  child: SizedBox(
                    height: 68,
                    child: ListView.builder(
                      itemCount: 4, // Le nombre de champs TextFormField souhaités
                      scrollDirection: Axis.horizontal, // Orientation horizontale
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              }, 
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(color: Colors.white12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal.shade100,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white60,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> const Page4()),
                      );
                },
                  child: Text("Renvoyer le code", style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {},
                child: Text("Changer de numero", style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                ),),
              ),
              Stack(
                children: [
                  Icon(Icons.arrow_right),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
