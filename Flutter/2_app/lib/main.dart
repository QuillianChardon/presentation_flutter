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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HotelSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: null,
        icon: const Icon(Icons.arrow_back),
        color: Colors.grey[800],
        iconSize: 20,
      ),
      title: const Text(
        'Explore',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: const Icon(Icons.favorite_outline_rounded),
          color: Colors.grey[800],
        ),
        IconButton(
          onPressed: null,
          icon: const Icon(Icons.place),
          color: Colors.grey[800],
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'London',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  size: 26,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Colors.greenAccent[200],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Container(
          height: 50,
          color: Colors.red,
        ),
      ]),
    );
  }
}

class HotelSection extends StatelessWidget {
  const HotelSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1500,
      color: Colors.white,
    );
  }
}
