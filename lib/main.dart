import 'package:cardflip/cardW.dart';
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
  bool isFlipped = false;
  String month = '';
  String year = '';
  String cardName = 'Card Name';
  String cardNumber = '';
  String cvv = '';
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

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
                              print('Entrou');
                              setState(() {
                                cardLogo = flag.logoImage;
                                cardName = flag.flagName;
                              });
                            } else if (value.isEmpty) {
                              setState(() {
                                cardName = 'Card Name';
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
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Text('Month: '),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                maxLength: 2,
                                onChanged: (value) => setState(() {
                                      month = value;
                                      _monthController.text = value;
                                    })),
                          ),
                          const Text('Year: '),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                maxLength: 2,
                                onChanged: (value) => setState(() {
                                      year = value;
                                      _yearController.text = value;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            CardWidget(
              isFlipped: isFlipped,
              cardLogo: cardLogo,
              cardName: cardName,
              cardNumber: cardNumber,
              cvv: cvv,
              month: month,
              year: year,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    onPressed: () => setState(() {
                          if (isFlipped == true) {
                            isFlipped = false;
                            return;
                          }
                          if (isFlipped == false) {
                            isFlipped = true;
                            return;
                          }
                        }),
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
