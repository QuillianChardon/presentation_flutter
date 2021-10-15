// @dart=2.10
import 'NE_PAS_TOUCHER/user_input.dart';
import 'user.dart';

void main() {
  Exemple1();
}

void Exemple1() {
  var user = User();
  user.nom = readText("Votre nom");
  user.score = 12;

  user.helloUser();
  user.helloUser2();
}
