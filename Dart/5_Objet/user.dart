class User {
  String nom = "";
  int score = 0;

  void helloUser() {
    print("Bonjour $nom");
  }

  void helloUser2() {
    var nom = this.nom.toUpperCase();
    print("Bonjour $nom");
  }
}
