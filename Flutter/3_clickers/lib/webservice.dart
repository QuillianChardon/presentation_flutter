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
      return Text(snapshot.data.email);
    } else if (snapshot.hasError) {
      return Text("Erreur de chargement");
    } else {
      return CircularProgressIndicator();
    }
  }

  Future<User> _fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return User.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception("Erreur de chargement des données");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<User>(
          builder: myBuilder,
          future: _fetchData(),
        ),
      ),
    );
  }
}
