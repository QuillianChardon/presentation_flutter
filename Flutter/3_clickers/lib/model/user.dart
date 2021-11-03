class User {
  final int id;
  final String name;
  final String email;

  User({this.id = 0, this.name = "", this.email = ""});

  User.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"];
}
