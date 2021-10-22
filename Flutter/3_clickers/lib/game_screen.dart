import 'dart:async';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _nbClic = 0;
  bool _isClicked = false;
  int _record = 0;
  String _CurrentPlayer = "";
  String _CurrentPlayerRecord = "";

  var _formKey = GlobalKey<FormState>();

  _changeButton() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _isClicked = true;
        Timer(const Duration(seconds: 10), _stopGame);
      }
    });
  }

  _setPrenom(prenom) {
    setState(() {
      _CurrentPlayer = prenom;
    });
  }

  _stopGame() {
    setState(() {
      if (_record < _nbClic) {
        _record = _nbClic;
        _CurrentPlayerRecord = _CurrentPlayer;
      }
      _nbClic = 0;
      _isClicked = false;
    });
  }

  __addClicks() {
    setState(() {
      _nbClic++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clicker"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_record != 0)
              Text(
                  "Score max depuis le lancement de l'app ! $_record de $_CurrentPlayerRecord"),
            Text("Nombre de clics : $_nbClic"),
            if (_isClicked)
              IconButton(onPressed: __addClicks, icon: Icon(Icons.plus_one)),
            Spacer(),
            if (!_isClicked)
              //OutlinedButton(onPressed: _changeButton, child: Text("Commencer a compter")),
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: "Ted",
                        decoration: const InputDecoration(
                            helperText: "Entrez votre prénom",
                            hintText: "Prénom"),
                        onChanged: _setPrenom,
                        onSaved: _setPrenom,
                        autocorrect: false,
                        autofillHints: const [AutofillHints.givenName],
                        keyboardType: TextInputType.name,
                        validator: (value) =>
                            value!.length > 2 ? null : "Prenom trop court",
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _changeButton,
                        child: Text("Commencer a compter")),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}