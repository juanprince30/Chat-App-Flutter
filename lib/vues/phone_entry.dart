import 'package:chat_app/outils/codeCreate.dart';
import 'package:chat_app/outils/sms_telephony.dart';
import 'package:flutter/material.dart';

class PhoneEntry extends StatefulWidget {
  @override
  _PhoneEntryState createState() => _PhoneEntryState();
}



class _PhoneEntryState extends State<PhoneEntry> {
  final TextEditingController _phoneController = TextEditingController();

  Future<bool?> askSMSPermission() async {
    return await SmsTelephony.askPermission();
  }

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      controller: _phoneController,
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
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
        child: FloatingActionButton(
          onPressed: () async {
            String code = codeCreate();
            bool? askSMS = await SmsTelephony.askPermission();
            print("demande: $askSMS");
            if(askSMS == true) {
              SmsTelephony.sendSMSTelephony(_phoneController.text, code);
              print("Numéro saisi: ${_phoneController.text}");
              Navigator.pushNamed(context, "/identity");
            }

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

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
