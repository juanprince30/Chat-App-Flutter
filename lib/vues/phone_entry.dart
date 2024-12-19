import 'package:chat_app/models/country.dart';
import 'package:chat_app/outils/codeCreate.dart';
import 'package:chat_app/outils/sms_telephony.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneEntry extends StatefulWidget {
  @override
  _PhoneEntryState createState() => _PhoneEntryState();
}

class _PhoneEntryState extends State<PhoneEntry> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController countryIdController = TextEditingController();

  List<Country> countries = [];
  String? selectedCountryCode = '+226';



  @override
  void initState() {
    super.initState();

  }

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
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.1, screenWidth * 0.5, screenWidth * 0.08, 0),
              child: Center(
                child: Text(
                  "Entrez votre numéro de téléphone",
                  style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, screenWidth * 0.1, screenWidth * 0.08, 0),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.063,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          selectedCountryCode = country.dialCode;
                          print(
                              'Code: ${country.dialCode}, Nom: ${country.name}');
                        });
                      },
                      textStyle: TextStyle(fontSize: 12, color: Colors.black),
                      textOverflow: TextOverflow.ellipsis,
                      initialSelection: 'BF',
                      favorite: ['+226', 'BF'],
                      showFlag: true,
                      showFlagDialog: true,
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Entrez votre numéro",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: FloatingActionButton(
          onPressed: () async {
            try {
              String code = codeCreate();
              String phoneNumber = _phoneController.text.trim();

              if (phoneNumber.isEmpty) {
                print(
                    "Erreur : Aucun numéro de téléphone.");
                return;
              }

              bool? askSMS = await SmsTelephony.askPermission();
              print("Permission SMS accordée : $askSMS");

              if (askSMS == true) {
                String fullPhoneNumber = "$selectedCountryCode$phoneNumber";
                SmsTelephony.sendSMSTelephony(fullPhoneNumber, code);
                print(fullPhoneNumber);

                String? receivedCode = await SmsTelephony.getLastSendSMS() ?? 'Pas de code trouvé';
                //String? receivedCode = '1234';
                print("Numéro saisi : $fullPhoneNumber");
                print("Code reçu : $receivedCode");

                Navigator.pushNamed(
                  context,
                  "/identity",
                  arguments: {
                    'receivedCode': receivedCode,
                    'phoneNumber': fullPhoneNumber,
                  },
                );
              } else {
                print("Permission SMS refusée.");
              }
            } catch (e) {
              print("Erreur lors de l'envoi du SMS : $e");
            }
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

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
