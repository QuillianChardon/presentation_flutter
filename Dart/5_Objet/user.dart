class User {
  String nom = "";
  int score = 0;

  String _prenom = "";

  String get prenom => _prenom;

  set prenom(String prenom) {
    _prenom = prenom;
  }

  void helloUser() {
    print("Bonjour $nom $score point");
  }

  void helloUser2() {
    var nom = this.nom.toUpperCase();
    print("Bonjour $nom  && ${this.nom}");
  }
}
