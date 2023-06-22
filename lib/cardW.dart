import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({
    super.key,
    required this.isFlipped,
    required this.cardLogo,
    required this.cardName,
    required this.cardNumber,
    required this.cvv,
    required this.month,
    required this.year,
  });
  bool isFlipped;
  String cardName;
  String cardNumber;
  Image cardLogo;
  String cvv;
  String year;
  String month;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
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
                borderRadius: BorderRadius.circular(25), color: Colors.cyan),
            child: !widget.isFlipped
                ? Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.cardName),
                        Image.asset(
                          'assets/Card_Chip.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(widget.cardNumber),
                        Center(
                          child: Row(
                            children: [
                              const Text('Val:'),
                              Text('${widget.month}/${widget.year}'),
                            ],
                          ),
                        ),
                        Container(
                          child: widget.cardLogo,
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        color: Colors.black,
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.cvv,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
