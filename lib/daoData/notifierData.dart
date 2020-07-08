import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_vegetables/GestionTheme/AppTheme.dart';
import 'package:fruits_vegetables/modals/animal.dart';
import 'package:fruits_vegetables/modals/capital.dart';
import 'package:fruits_vegetables/modals/country.dart';
import 'package:fruits_vegetables/modals/fruit.dart';
import 'package:fruits_vegetables/modals/game.dart';
import 'package:fruits_vegetables/modals/job.dart';
import 'package:fruits_vegetables/modals/legume.dart';
import 'package:fruits_vegetables/repository/repoData.dart';

class NotifierData with ChangeNotifier {
  RepoData repo = new RepoData();

  Game gameStarted;
  ThemeData currentTheme = AppTheme.lightTheme;

  changeTheme(typeoftheme){
    if(typeoftheme == 'light'){
      print("weslt");
      currentTheme = AppTheme.lightTheme;
    }
    else{
      print("ici");
      currentTheme = AppTheme.darkTheme;
    }
    notifyListeners();
  }


  void getStarted(int i) {
    if (i == 1) {
      print("LeTS PLAY E");
      gameStarted = new Game("easy", 5, "");
    } else if (i == 2) {
      print("LeTS PLAY M");
      gameStarted = new Game("medium", 3, "");
    } else if (i == 3) {
      print("LeTS PLAY D");
      gameStarted = new Game("difficult", 1, "");
    }
  }

  void setGameInitialDATA(int i) async {
    
    Country countries;
    Legume legumes;
    Capital capitaux;
    Job jobs;
    Animal animeaux;
    Fruit fruits;

    if (i == 1) {
      countries = new Country(
          "Country", "assets/img/app-countries-green.jpg", null, false);
      legumes =
          new Legume("Legume", "assets/img/app-legumes-green.jpg", false);
      // capitaux = new Capital(
      //     "Capital", "assets/img/app-capitals-green.jpg", null, );
      capitaux = new Capital("Capital", "assets/img/app-capitals-green.jpg", false);
      jobs = new Job("Job", "assets/img/app-jobs-green.jpg", false);
      animeaux =
          new Animal("Animal", "assets/img/app-animals-green.jpg", false);
      fruits =
          new Fruit("Fruit", "assets/img/app-fruits-green.png", null, false);
    } else if (i == 2) {
      countries = new Country(
          "Country", "assets/img/app-countries-yellow.jpg", null, false);
      legumes = new Legume(
          "Legume", "assets/img/app-legumes-yellow.jpg", false);
      // capitaux = new Capital(
      //     "Capital", "assets/img/app-capitals-yellow.jpg", null, false);
      capitaux = new Capital("Capital", "assets/img/app-capitals-yellow.jpg", false);

      jobs = new Job("Job", "assets/img/app-jobs-yellow.jpg", false);
      animeaux = new Animal(
          "Animal", "assets/img/app-animals-yellow.jpg", false);
      fruits =
          new Fruit("Fruit", "assets/img/app-fruits-yellow.png", null, false);
    } else if (i == 3) {
      countries = new Country(
          "Country", "assets/img/app-countries-red.jpg", null, false);
      legumes =
          new Legume("Legume", "assets/img/app-legumes-red.jpg", false);
      // capitaux = new Capital(
      //     "Capital", "assets/img/app-capitals-red.jpg", null, false);
      capitaux = new Capital("Capital", "assets/img/app-capitals-red.jpg", false);
      jobs = new Job("Job", "assets/img/app-jobs-red.jpg", false);
      animeaux =
          new Animal("Animal", "assets/img/app-animals-red.jpg", false);
      fruits = new Fruit("Fruit", "assets/img/app-fruits-red.png", null, false);
    }

    List<String> anims ;
    List<String> legums ;
    List<String> jobss ;
    await repo.loadAnimal(gameStarted.lettre).then((value){
      anims = value;
    });
    await repo.loadVegetables(gameStarted.lettre).then((value){
      legums = value;
    });
    await repo.loadJobs(gameStarted.lettre).then((value){
      jobss = value;
    });

    animeaux.words = anims;
    legumes.words = legums;
    jobs.words = jobss;

    List<dynamic> elements = new List();
    elements.add(countries);
    elements.add(legumes);
    elements.add(capitaux);
    elements.add(jobs);
    elements.add(animeaux);
    elements.add(fruits);

    this.gameStarted.Elements = elements;
  }

  Future<bool> checkSomething(int index, String label) async {

    if(label == null || label == ""){
      return false;
    }
    
    if(label[0].toLowerCase() != gameStarted.lettre.toLowerCase()){
      return false;
    }

    if(index == 0){
      bool state = false;
      await repo.isCountryCorrect(label).then((value) => {
        // print(value),
        state = value,
      });
      return state;
    }else if(index == 1){
      List<String> legumss = gameStarted.Elements[index].words;
      for(int i = 0; i< legumss.length; i++){
        if(legumss[i] == label.toLowerCase()) return true;
      }
      return false;
    }else if(index == 2){
      bool state = false;
      await repo.isCapitalCorrect(label).then((value) => {
        // print(value),
        state = value,
      });
      return state;
    }else if(index == 3){
      List<String> jobss = gameStarted.Elements[index].words;
      for(int i = 0; i< jobss.length; i++){
        if(jobss[i] == label.toLowerCase()) return true;
      }
      return false;
    }else if(index == 4){
      List<String> animalss = gameStarted.Elements[index].words;
      // print(animalss);
      for(int i = 0; i< animalss.length; i++){
        if(animalss[i] == label.toLowerCase()) return true;
      }
      return false;
    }else if(index == 5){
      bool state = false;
      await repo.isFruitCorrect(label).then((value) => {
        // print(value),
        state = value,
      });
      return state;
    }else{
      return false;
    }

    
  }

  Future<List<String>> helpMe(String lettre) async{
    List<String> list = new List<String>();
    if(gameStarted.Elements[0].isDone && gameStarted.Elements[1].isDone && gameStarted.Elements[2].isDone && gameStarted.Elements[3].isDone && gameStarted.Elements[4].isDone && gameStarted.Elements[5].isDone ){
      list.add("Congratulation");
      return list;
    }
    list.add("Answers for the next time");
    if(gameStarted.Elements[0].isDone == false){
      await repo.getRandomCountryByLettre(lettre).then((value) {
        if(value != null){
          print(value);
          list.add(gameStarted.Elements[0].label + " : " +  value);

        }
      });
    }
    if(gameStarted.Elements[1].isDone == false){
      await repo.getRandomLegumeByLettre(lettre).then((value) {
        if(value != null){
          print(value);

          list.add(gameStarted.Elements[1].label + " : " +  value);

        }
      });
    }
    if(gameStarted.Elements[2].isDone == false){
      await repo.getRandomCapitalByLettre(lettre).then((value) {
        if(value != null){
          print(value);

          list.add(gameStarted.Elements[2].label + " : " +  value);

        }
      });
    }
    if(gameStarted.Elements[3].isDone == false){
      await repo.getRandomJobeByLettre(lettre).then((value) {
        if(value != null){
          print(value);

          list.add(gameStarted.Elements[3].label + " : " +  value);

        }
      });
    }
    if(gameStarted.Elements[4].isDone == false){
      await repo.getRandomAnimaleByLettre(lettre).then((value) {
        if(value != null){
          print(value);

          list.add(gameStarted.Elements[4].label + " : " +  value);
        }
      });
    }

    if(list.length == 1 ){
      List<String> listVc = new List<String>();
      listVc.add("Good Luck Next Time");
      return listVc;
    }
    // if(gameStarted.Elements[5].isDone == false){
    //   print(gameStarted.Elements[5].label);
    //   await repo.getRandomAnimaleByLettre(lettre).then((value) {
    //     if(value != null){
    //       list.add(value);
    //     }
    //   });
    // }
  
    return list;
  }
}
