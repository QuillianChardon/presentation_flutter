import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Nombre de clics :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (_counter > 0) const Text('Continuez a cliquer'),
            if (_counter > 5 && _counter < 10) const Text('Ok... pas mal'),
            if (_counter >= 10 && _counter < 20)
              const Text('Woaaahou ça clique sec ici !'),
            if (_counter >= 20 && _counter < 35)
              const Text("J'aime les panoramas"),
            if (_counter >= 35 && _counter < 60) const Text("Ok... pas mal"),
            if (_counter >= 60 && _counter < 120)
              const Text("J'aime me beurrer la biscotte"),
            if (_counter >= 120 && _counter < 200)
              const Text("J'aime le bruit blanc de l'eau"),
            if (_counter >= 200 && _counter < 210)
              const Text("J'aime quand on m'enduit d'huile"),
            if (_counter >= 201 && _counter < 350)
              const Text(
                  " J'aime quand une jolie femme brune m'apporte mon petit déjeuner au lit"),
            if (_counter > 350)
              const Text("Vous dites ça à toutes les femmes."),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
