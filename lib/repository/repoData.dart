import 'dart:convert';

import 'package:http/http.dart' as http;

String apiUrlCapitals = "https://restcountries.eu/rest/v2/capital/";
// String apiUrlMovies = "https://cinema-backend-mundia.herokuapp.com/search/ville=";
// String apiUrlMoviesDetails = "https://cinema-backend-mundia.herokuapp.com/getCinemasSalles/ville=";
// String apiUrlSeancesOfSalle = "https://cinema-backend-mundia.herokuapp.com/getSeances/salle=";
// String apiUrlPayement = "https://cinema-backend-mundia.herokuapp.com/payerLmok";

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
}