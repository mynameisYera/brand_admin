import 'package:flutter/widgets.dart';

class QueryWidthSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
