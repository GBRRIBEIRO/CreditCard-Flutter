import 'package:cardflip/data/flagsData.dart';
import 'package:cardflip/models/flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Credit Card App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cardName = 'Card Name';
  String cardNumber = '';
  Widget cardLogo = Container();

  void openModal(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Container(
            child: Column(children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  )
                ],
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  Flags.forEach((fl) {
                    fl.initials.forEach((init) {
                      if (value.startsWith(init)) {
                        print('object');
                        cardLogo = fl.logoImage;
                      } else {
                        cardLogo = Container();
                      }
                    });
                  });

                  cardNumber = value;
                }),
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.cyan),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cardName),
                      Image.asset(
                        'assets/Card_Chip.png',
                        width: 40,
                        height: 40,
                      ),
                      Text(cardNumber),
                      Center(
                        child: Row(
                          children: [
                            const Text('Val:'),
                            Text('10/09'),
                          ],
                        ),
                      ),
                      Container(
                        child: cardLogo,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.refresh,
                )),
            FloatingActionButton(
                onPressed: () {
                  openModal(context);
                },
                child: const Icon(
                  Icons.edit,
                )),
          ],
        ),
      ],
    ));
  }
}
