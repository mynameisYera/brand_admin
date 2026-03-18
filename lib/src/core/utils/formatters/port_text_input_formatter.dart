import 'package:flutter/services.dart';

List<TextInputFormatter>? portFormatter = <TextInputFormatter>[
  LengthLimitingTextInputFormatter(5),
  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
];
