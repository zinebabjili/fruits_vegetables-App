import 'package:fruits_vegetables/modals/country.dart';
import 'package:fruits_vegetables/modals/animal.dart';
import 'package:fruits_vegetables/modals/capital.dart';
import 'package:fruits_vegetables/modals/fruit.dart';
import 'package:fruits_vegetables/modals/job.dart';
import 'package:fruits_vegetables/modals/legume.dart';

class Game{

  final String level;
  final double dure;
  final Country country;
  final Fruit fruit;
  final Job job;
  final Legume legume;
  final Animal animal;
  final Capital capital;

  Game(this.level, this.dure, this.country, this.fruit, this.job, this.legume, this.animal, this.capital);
  

}