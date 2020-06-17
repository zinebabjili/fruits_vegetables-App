import 'package:flutter/cupertino.dart';
import 'package:fruits_vegetables/modals/game.dart';
import 'package:fruits_vegetables/repository/repoData.dart';

class NotifierData with ChangeNotifier {
  RepoData repo = new RepoData();

  Game gameStarted;

  void getStarted(int i) {
    
    if (i == 1) {
      print("LeTS PLAY D");
    } else if (i == 2) {
      print("LeTS PLAY M");
    } else if (i == 3) {
      print("LeTS PLAY E");
    }
  }
}
