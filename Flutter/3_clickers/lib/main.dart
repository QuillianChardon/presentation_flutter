import 'package:clickers/assets_manager.dart';
import 'package:clickers/asynchrone.dart';
import 'package:clickers/list_view.dart';
import 'package:clickers/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      //home: ListeView(),
      //home: Asynchrone(),
      // home: WebService(),
      home: GameScreen(),
      //home: const Accueil(),
    );
  }
}

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  String _prenom = "";
  var _formKey = GlobalKey<FormState>();

  _setPrenom(prenom) {
    setState(() {
      _prenom = prenom;
    });
  }

  _confirmeNouveauPrenom() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder<String>(
            future:
                Assets.loadTextFile("text_files/lorem.txt", context: context),
            builder: (context, snapshot) {
              return Text(snapshot.hasData ? snapshot.data ?? "" : "");
            },
          ),
          Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: "Ted",
                    decoration: const InputDecoration(
                        helperText: "Entrez votre prénom", hintText: "Prénom"),
                    onChanged: _setPrenom,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.givenName],
                    keyboardType: TextInputType.name,
                    validator: (value) =>
                        value!.length > 2 ? null : "Prenom trop court",
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
                IconButton(
                    onPressed: _confirmeNouveauPrenom,
                    icon: const Icon(Icons.check))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
