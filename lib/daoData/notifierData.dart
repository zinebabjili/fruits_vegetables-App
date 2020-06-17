import 'package:flutter/cupertino.dart';
import 'package:fruits_vegetables/modals/game.dart';
import 'package:fruits_vegetables/repository/repoData.dart';

class NotifierData with ChangeNotifier {
  RepoData repo = new RepoData();

  Game gameStarted;

  void getStarted(int i) {
    
    if (i == 1) {
      print("LeTS PLAY D");
      gameStarted = new Game("easy" , 5, "", null, null, null, null, null, null);
    } else if (i == 2) {
      print("LeTS PLAY M");
      gameStarted = new Game("medium", 3, "", null, null, null, null, null, null);
    } else if (i == 3) {
      print("LeTS PLAY E");
      gameStarted = new Game("difficult", 2, "", null, null, null, null, null, null);
    }
  }
}
