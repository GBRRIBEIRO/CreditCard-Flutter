import 'package:flutter/material.dart';

import '../models/flags.dart';

final Flag visa = Flag(
  flagName: 'Visa',
  initials: ['4'],
  logoImage: Image.asset('assets/Visa-Logo.png', width: 40, height: 40),
);

final Flag mastercard = Flag(
  flagName: 'MasterCard',
  initials: ['51', '52', '53', '54', '55'],
  logoImage: Image.asset('assets/Mastercard.png', width: 40, height: 40),
);

final Flag diners = Flag(
  flagName: 'Diners Club',
  initials: ['36', '38'],
  logoImage: Image.asset('assets/diners.png', width: 40, height: 40),
);

List<Flag> Flags = [mastercard, visa, diners];
