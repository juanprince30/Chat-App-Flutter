import 'dart:convert';
import 'package:chat_app/models/country.dart';
import 'package:http/http.dart' as http;

Future<void> fetchCountries() async {
  print("fetchCountries");
  final url = Uri.parse('https://restcountries.com/v3.1/name/gabon');
  final response;
  try{
    response = await http.get(url);
    print(response.body);
  } catch(e) {
    print("api non fonctionnel $e");
  }

  /*print("fetchCountries 2");

  List<dynamic> countries = [];

  if (response.statusCode == 200) {
    List<dynamic> countries = jsonDecode(response.body);
    print(jsonDecode(response.body));

    countries.sort((a, b) {
      return a['name']['common'].compareTo(b['name']['common']);
    });

    print("fetchCountries 4");

    countries.forEach((country) {
      print(country['name']['common']);
    });
  } else {
    print('Failed to load countries');
    print("fetchCountries 5");

  }
  print("fetchCountries 6");

  return countries;*/

}
/*
Future<List<Country>> getCountryFlagsAndID() async {
  print("getCountryFlagsAndID");
  final countries = await fetchCountries();
  print("getCountryFlagsAndID 2");
  List<Country> countriesFlagsAndID = [];
  print("getCountryFlagsAndID 3");

  for (var country in countries) {
    print("getCountryFlagsAndID 4");
    print('fffff: ${country[0]['idd'].toString()
    }');
    if (country['idd'] != null && country['flags'] != null) {
      print(country['idd'].toString());
      String id = country['idd']['suffixes']?[0] ?? "";
      String flag = country['flags']['png'] ?? "";

      Country? temps;
      temps?.id = id;
      temps?.flag = flag;
      print("getCountryFlagsAndID 5");

      print(temps?.id);
      print(temps?.flag);
      countriesFlagsAndID.add(temps!);
      print("getCountryFlagsAndID 6");

    }
  }
  print("getCountryFlagsAndID 7");

  return countriesFlagsAndID;
}

*/