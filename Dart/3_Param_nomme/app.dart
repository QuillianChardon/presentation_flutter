//import 'NE_PAS_TOUCHER/user_input.dart';

void main() {
  //Exemple1();
  //Exemple2();
  Exemple3();
}

//EXEMPLE 1
void Exemple1() {
  direBonjour1("toto", 12);
}

void direBonjour1(String nom, int age) {
  print("Bonjour $nom et $age an(s) !");
}

//EXEMPLE 2
void Exemple2() {
  direBonjour2("toto", age: 12);
  direBonjour2("toto");
  direBonjour21("toto");
}

void direBonjour2(String nom, {int? age}) {
  print("Bonjour $nom et $age an(s) !");
}

void direBonjour21(String nom, {int age = 15}) {
  print("Bonjour $nom et $age an(s) !");
}

//EXEMPLE 3
void Exemple3() {
  direBonjour3(nom: "toto", age: 12);
  direBonjour3(age: 12, nom: "toto");
}

void direBonjour3({String nom = "titi", int age = 15}) {
  print("Bonjour $nom et $age an(s) !");
}
