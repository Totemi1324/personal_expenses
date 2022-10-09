import 'package:flutter/material.dart';

final Map<String, Map<String, Object>> categoryIcons = {
  'Lebensmittel': {
    'icon_outline': Icons.shopping_basket_outlined,
    'icon_fill': Icons.shopping_basket,
    'theme': const Color.fromARGB(255, 181, 234, 215),
  },
  'Gadgets': {
    'icon_outline': Icons.memory_outlined,
    'icon_fill': Icons.memory,
    'theme': const Color.fromARGB(255, 255, 154, 162),
  }
};

final Map<String, String> currencySymbols = {
  'Euro': '€',
  'US-Dollar': '\$',
  'Schweizer Franken': 'Fr.',
};

final String currentCurrency = 'Schweizer Franken';
