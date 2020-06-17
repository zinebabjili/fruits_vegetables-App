import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

String apiUrlCapitals = "https://restcountries.eu/rest/v2/capital/";
String apiUrlCountries = "https://restcountries.eu/rest/v2/name/";
String apuiUrlFruits = "http://www.fruityvice.com/api/fruit/";

class RepoData {

  Future<bool> isCapitalCorrect(String capital) async {
    final http.Response response = await http.get(apiUrlCapitals + capital + "?fullText=true");
    if (response.statusCode != 200) {
      // throw Exception();
      return false;
    }

    var rbody = response.body;

    final jsonDecoded = json.decode(rbody);
    for (var i = 0; i < jsonDecoded.length; i++) {
      if(jsonDecoded[i]["capital"].toLowerCase()  == capital.toLowerCase()){
        return true;
      }
    }

    return false;
  }

  Future<bool> isCountryCorrect(String country) async {
    final http.Response response = await http.get(apiUrlCountries + country + "?fullText=true");
    if (response.statusCode != 200) {
      // throw Exception();
      return false;
    }

    var rbody = response.body;

    final jsonDecoded = json.decode(rbody);
    for (var i = 0; i < jsonDecoded.length; i++) {
      if(jsonDecoded[i]["name"].toLowerCase()  == country.toLowerCase()){
        return true;
      }
    }
    return false;
  }

  Future<bool> isFruitCorrect(String fruit) async {

    final http.Response response = await http.get( apuiUrlFruits + fruit );
    

    if (response.statusCode != 200) {
      // throw Exception();
      return false;
    }

    var rbody = response.body;

    final jsonDecoded = json.decode(rbody);
    for (var i = 0; i < jsonDecoded.length; i++) {
      return true;
    }
    return false;
  }

}
