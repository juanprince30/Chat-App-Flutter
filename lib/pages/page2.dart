import 'package:chat_app/Pages/page3.dart';
import 'package:chat_app/tools/color.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final countryPicker = const FlCountryCodePicker();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  CountryCode? _selectedCountryCode;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default country code
    _selectedCountryCode = const CountryCode(name: 'United States', code: 'US', dialCode: '+1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Entrer le Numero de Telephone',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nous vous envoyerez un SMS avec un code pour verifier votre Numero de Telephone.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final code = await countryPicker.showPicker(context: context);
                    if (code != null) {
                      setState(() {
                        _selectedCountryCode = code;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      _selectedCountryCode?.dialCode ?? '+1',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Entrer votre Numero de telephone',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey[900],
                      ),
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Entrer votre Numero";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  Page3(tel: "${_selectedCountryCode?.dialCode}${_phoneController.text}")));
                      } else {
                       
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(backgroundColor: Colors.red,content: Text('Veuillez corriger les erreurs'),),
                        );
                      }

                  print('Phone number: ${_selectedCountryCode?.dialCode} ${_phoneController.text}');

                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueOurColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
