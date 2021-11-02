import 'package:flutter/material.dart';

class ListeView extends StatefulWidget {
  const ListeView({Key? key}) : super(key: key);

  @override
  _ListeViewState createState() => _ListeViewState();
}

class _ListeViewState extends State<ListeView> {
  var _listeUrlImages = <String>[
    "https://picsum.photos/400/200",
    "https://picsum.photos/400/200",
    "https://picsum.photos/400/200",
    "https://picsum.photos/400/200",
    "https://picsum.photos/400/200",
  ];

  Widget _generateurDeLigne(BuildContext context, int numeroDeLigne) {
    return Image.network(_listeUrlImages[numeroDeLigne]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: _generateurDeLigne,
        itemCount: _listeUrlImages.length,
      ),
    );
  }
}
