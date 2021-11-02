import 'package:flutter/material.dart';

class Asynchrone extends StatefulWidget {
  const Asynchrone({Key? key}) : super(key: key);

  @override
  _AsynchroneState createState() => _AsynchroneState();
}

class _AsynchroneState extends State<Asynchrone> {
  Future<String> _fonctionDeChargement() async {
    return Future.delayed(Duration(seconds: 3), () => " <3 purple giraffe <3");
  }

  Widget myBuilder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data.toString());
    } else if (snapshot.hasError) {
      return const Text("Erreur de chargement");
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          builder: myBuilder,
          future: _fonctionDeChargement(),
        ),
      ),
    );
  }
}
