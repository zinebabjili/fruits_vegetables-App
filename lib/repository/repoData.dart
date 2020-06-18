import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

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
    
    if(jsonDecoded.length > 1){
      return false;
    }
    
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
    if(jsonDecoded.length > 1){
      return false;
    }

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

  Future<List<String>> loadAnimal(String char) async {
    final  response = await rootBundle.loadString('assets/json/animal-data.json'); 
    final decoded = json.decode(response);
    List<String> words= new List<String>();

    for (var i = 0; i < decoded.length; i++) {
      String val = decoded[i];
      if(val[0].toLowerCase() == char.toLowerCase()){
        words.add(val.toLowerCase());
      }
    }

    return words;

  }

  Future<List<String>> loadVegetables(String char) async {
    final  response = await rootBundle.loadString('assets/json/legume-data.json'); 
    final decoded = json.decode(response);
    List<String> words= new List<String>();

    for (var i = 0; i < decoded.length; i++) {
      String val = decoded[i];
      if(val[0].toLowerCase() == char.toLowerCase()){
        words.add(val.toLowerCase());
      }
    }
    return words;

  }

  Future<List<String>> loadJobs(String char) async {
    final  response = await rootBundle.loadString('assets/json/jobs-data.json'); 
    final decoded = json.decode(response);
    List<String> words= new List<String>();

    for (var i = 0; i < decoded.length; i++) {
      String val = decoded[i];
      if(val[0].toLowerCase() == char.toLowerCase()){
        words.add(val.toLowerCase());
      }
    }
    return words;

  }

}
