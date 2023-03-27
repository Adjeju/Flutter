import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CardItem {
  String? imgUrl;
  String? title;
  String? description;

  CardItem({this.imgUrl, this.title, this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My stateless widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int idx = 1;

  List<CardItem> cardsItems = [
    CardItem(
        imgUrl: 'assets/react.png',
        title: 'React',
        description:
            'React — відкрита JavaScript бібліотека для створення інтерфейсів користувача, яка покликана вирішувати проблеми часткового оновлення вмісту вебсторінки, з якими стикаються в розробці односторінкових застосунків'),
    CardItem(
        imgUrl: 'assets/vu.png',
        title: 'Vue',
        description:
            "Vue.js — JavaScript-фреймворк, що використовує шаблон MVVM для створення інтерфейсів користувача на основі моделей даних, через реактивне зв'язування даних"),
    CardItem(
        imgUrl: 'assets/angular.png',
        title: 'Angular',
        description:
            'Angular — написаний на TypeScript front-end фреймворк з відкритим кодом, який розробляється під керівництвом Angular Team Архівовано 18 серпня 2021 у Wayback Machine. у компанії Google, а також спільнотою приватних розробників та корпорацій'),
    CardItem(
        imgUrl: 'assets/solid.png',
        title: 'SolidJS',
        description:
            "Solid is an open-source project supported by a team of public contributors. It's distributed under an MIT license")
  ];

  void _nextPage() {
    if (idx == cardsItems.length - 1) {
      setState(() {
        idx = 0;
      });
      return;
    }

    setState(() {
      idx++;
    });
  }

  void _prevPage() {
    if (idx == 0) {
      setState(() {
        idx = cardsItems.length - 1;
      });
      return;
    }

    setState(() {
      idx--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.lime,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image(
                            width: 200,
                            height: 200,
                            image: AssetImage(cardsItems[idx].imgUrl!)),
                        Text(cardsItems[idx].title!,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(
                          cardsItems[idx].description!,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: _prevPage, child: const Text('Prev page')),
                    OutlinedButton(
                        onPressed: _nextPage, child: const Text('Next page'))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
