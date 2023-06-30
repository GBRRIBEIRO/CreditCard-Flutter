import 'package:flutter/material.dart';

class CardBack extends StatefulWidget {
  CardBack({
    super.key,
    required this.cvv,
    required this.cardName,
    required this.month,
    required this.year,
    required this.cardNumber,
  });
  final String cvv;
  final String cardName;
  final String month;
  final String year;
  final String cardNumber;
  @override
  State<CardBack> createState() => _CardBackState();
}

class _CardBackState extends State<CardBack> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[900]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.cardName),
                          Text(
                            widget.cardNumber,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  const Text('Valid:'),
                                  Text('${widget.month}/${widget.year}')
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                child: Column(
                                  children: [
                                    const Text('Cvv:'),
                                    Text(widget.cvv),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
