//import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  Exemple1();
}

//EXEMPLE 1
void Exemple1() {
  direBonjour1("toto", 12);
}

void direBonjour1(String nom, int age) {
  var nom2 = nom.toUpperCase();
  print("Bonjour $nom2 et $age an(s) !");
}
