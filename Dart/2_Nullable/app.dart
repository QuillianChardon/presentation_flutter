void main() {
  //Exemple1();
  //Exemple2();
  Exemple3();
}

//EXEMPLE 1
void direBonjour1(String? prenom) {
  if (prenom != null) {
    print("$prenom --> ${prenom.length} caract ");
  } else {
    print("Bonjour cher utilisateur");
  }
}

void Exemple1() {
  bool isAnonymous = true;
  String? user;
  if (!isAnonymous) {
    user = "Ted";
  } else {
    user = null;
  }
  direBonjour1(user);
}

//EXEMPLE 2
void Exemple2() {
  bool isAnonymous = false;
  String? user;
  if (!isAnonymous) {
    user = "Ted";
  } else {
    user = null;
  }
  direBonjour2(user);
}

void direBonjour2(String? prenom) {
  print("Bonjour cher ${prenom ?? "utilisateur"}");
}

//EXEMPLE 3

void Exemple3() {
  bool isAnonymous = true;
  String? user;
  if (isAnonymous) {
    user = null;
  } else {
    user = "Ted";
  }
  user = user?.toUpperCase();
  direBonjour2(user);
}
