import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../outils/codeCreate.dart';
import '../outils/sms_telephony.dart';

class Identity extends StatefulWidget {
  @override
  _IdentityState createState() => _IdentityState();
}

int numberOfControllers = 4;

class _IdentityState extends State<Identity> {

  List<TextEditingController> codeController = List.generate(
    numberOfControllers,
        (index) => TextEditingController(),
  );

  bool hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    String receivedCode = args['receivedCode'] ?? '1234';
    print(receivedCode);
    String? phoneNumber = args['phoneNumber'];

    Future.delayed(Duration(seconds: 3), () {
      List<String> codeArray = receivedCode.split('');
      setState(() {
        for (int i = 0; i < codeArray.length; i++) {
          codeController[i].text = codeArray[i];
        }
      });
    });

    String codeVerificationCOntroller = codeController.map((controller) => controller.text).join();

    void navigateWithAnimation(BuildContext context) {

      if (hasNavigated) return; // Empêche une navigation répétée

      setState(() {
        hasNavigated = true; // Marque la navigation comme effectuée
      });

      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.blue,
              size: 100,
            ),
          ),
        );

        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context); // Ferme le dialog
          Navigator.pushNamed(context, '/new_page'); // Navigue vers la nouvelle page
        });
      });
    }


    if(receivedCode == codeVerificationCOntroller) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigateWithAnimation(context);
      });    }



    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0F1828),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xff0F1828),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.1,
                    screenWidth * 0.2, screenWidth * 0.08, 0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Entrez votre code",
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "Vous avez reçu un SMS avec un code sur le numéro $phoneNumber",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenWidth * 0.1, screenWidth * 0.05, screenHeight * 0.04),
                child: Form(
                  child: SizedBox(
                    height: screenHeight * 0.1,
                    // Définit une hauteur fixe pour éviter les conflits
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.023),
                          child: SizedBox(
                            width: screenWidth * 0.18,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              controller: codeController[index],
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle:
                                    const TextStyle(color: Colors.white12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white10),
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
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
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
                onTap: () async {
                  String code = codeCreate();
                  bool? askSMS = await SmsTelephony.askPermission();
                  SmsTelephony.sendSMSTelephony(phoneNumber!, code);
                },
                child: Text(
                  "Renvoyer le code",
                  style: TextStyle(
                      fontSize: screenWidth * 0.04, color: Colors.white),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/phone_entry");
                },
                child: Text(
                  "Changer de numero",
                  style: TextStyle(
                      fontSize: screenWidth * 0.04, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.1, bottom: screenHeight * 0.02),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/phone_entry");
            },
            backgroundColor: const Color.fromARGB(255, 58, 94, 183),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: screenWidth * 0.08,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
