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
  user.prenom = "toto";

  user.helloUser();
  modifObject(user);
  user.helloUser();

  int a = 15;
  modifInt(a);
  print(a);
}

void modifObject(User u1) {
  u1.score = 15;
}

void modifInt(int ddsqfsdfq) {
  ddsqfsdfq = 16;
  print(ddsqfsdfq);
}
