import 'package:cardflip/card_back.dart';
import 'package:cardflip/data/flagsData.dart';
import 'package:cardflip/models/flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'card_front.dart';

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
  String month = '0';
  String year = '0';
  String cardName = 'Card Name';
  String cardNumber = '0';
  String cvv = '0';
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _cardNameController = TextEditingController();

  GestureFlipCardController _flipCardController = GestureFlipCardController();

  Image defaultImage = Image.asset(
    'assets/Transp.png',
    width: 40,
    height: 40,
  );
  Image cardLogo = Image.asset(
    'assets/Transp.png',
    width: 40,
    height: 40,
  );

  void openModal(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          cardName = value;
                        });
                      },
                      controller: _cardNameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: _cardNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        )
                      ],
                      maxLength: 16,
                      decoration: const InputDecoration(
                        hintText: 'Number',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        for (Flag flag in Flags) {
                          for (String init in flag.initials) {
                            if (value.startsWith(init)) {
                              setState(() {
                                cardLogo = flag.logoImage;
                              });
                            } else if (value.isEmpty) {
                              setState(() {
                                cardLogo = defaultImage;
                              });
                            }
                          }
                        }
                        setState(() {
                          cardNumber = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        )
                      ],
                      maxLength: 3,
                      decoration: const InputDecoration(
                        hintText: 'CVV',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                      controller: _cvvController,
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Text('Month: '),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                controller: _monthController,
                                maxLength: 2,
                                onChanged: (value) => setState(() {
                                      month = value;
                                    })),
                          ),
                          const Text('Year: '),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                controller: _yearController,
                                maxLength: 2,
                                onChanged: (value) => setState(() {
                                      year = value;
                                    })),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    _cvvController.text = cvv;
    _cardNumberController.text = cardNumber;
    _cardNameController.text = cardName;
    _monthController.text = month;
    _yearController.text = year;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          GestureFlipCard(
              frontWidget: CardFront(
                cardLogo: cardLogo,
              ),
              backWidget: CardBack(
                cardName: cardName,
                cardNumber: cardNumber,
                cvv: cvv,
                month: month,
                year: year,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
      ),
    ));
  }
}
