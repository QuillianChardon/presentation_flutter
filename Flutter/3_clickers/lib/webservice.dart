import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/user.dart';

class WebService extends StatefulWidget {
  const WebService({Key? key}) : super(key: key);

  @override
  _WebServiceState createState() => _WebServiceState();
}

class _WebServiceState extends State<WebService> {
  Widget myBuilder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, userIndex) {
            final user = snapshot.data[userIndex];
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  NetworkImage('https://picsum.photos/300/300'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text("Id : ${user.id}"),
                        Text("Nom : ${user.name}"),
                        Text("Email : ${user.email}"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ));
          });
    } else if (snapshot.hasError) {
      return Text("Erreur de chargement");
    } else {
      return CircularProgressIndicator();
    }
  }

  Future<List<User>> _fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List userJsonList = jsonDecode(response.body);
      return userJsonList
          .map((userJsonMap) => User.fromJSON(userJsonMap))
          .toList(); // utilisation de la fonction map pour faire de chaque case du tableau un reel objet user
    } else {
      throw Exception("Erreur de chargement des données");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<User>>(
          builder: myBuilder,
          future: _fetchData(),
        ),
      ),
    );
  }
}
