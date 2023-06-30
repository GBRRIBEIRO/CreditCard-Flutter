import 'package:flutter/material.dart';

class CardFront extends StatefulWidget {
  CardFront({
    super.key,
    required this.cardLogo,
  });
  final Widget cardLogo;
  @override
  State<CardFront> createState() => _CardFrontState();
}

class _CardFrontState extends State<CardFront> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[900]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Image.network(
                        'https://www04.wellsfargomedia.com/assets/images/icons/212x131/contactless-indicator_212x131.png',
                        width: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Image.asset(
                        'assets/Card_Chip.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        width: 65,
                        height: 65,
                        child: widget.cardLogo,
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Image.network(
                        'https://cdn.cookielaw.org/logos/3ded1b65-c8c1-4786-bfc3-cc82081127ef/f21a9737-2313-4300-b2bc-4a9f65409a2d/b890a33b-6c72-4221-86f5-26fd6aac0be3/picpay-logo-2.png',
                        width: 100,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
