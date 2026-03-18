part of 'theme.dart';

abstract class StaticColors {
  static const primary = Color(0xFF000824);
  static const secondary = Color(0xFFBCC1D0);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFF004D);
  static const lightRed = Color(0xFFFFC5D3);
  static const darkRed = Color(0xFF7B0025);
  static const blue = Color(0xFF0094FF);
  static const lightBlue = Color(0xFFCAECFF);
  static const green = Color(0xFF26CE55);
  static const lightGreen = Color(0xFFC3FFC2);
  static const background = Color(0xFFF8F9FB);
  static const stroke = Color(0xFFEEF0F4);
  static const transparent = Colors.transparent;
  static const kzColor = Color(0xFF00AEBD);
  static const gray = Colors.grey;
  static const gradientGray = Color(0xFF6673A3);
  static const mainGreen = Color(0xFF3E9970);
  static const backgroundColor = Color(0xFFF2F2F7);
}

extension ColorThemeDataExtension on ThemeData {
  Color get primary => StaticColors.primary;
  Color get secondary => StaticColors.secondary;
  Color get black => StaticColors.black;
  Color get white => StaticColors.white;
  Color get red => StaticColors.red;
  Color get lightRed => StaticColors.lightRed;
  Color get darkRed => StaticColors.darkRed;
  Color get blue => StaticColors.blue;
  Color get lightBlue => StaticColors.lightBlue;
  Color get green => StaticColors.green;
  Color get lightGreen => StaticColors.lightGreen;
  Color get background => StaticColors.background;
  Color get stroke => StaticColors.stroke;
  Color get transparent => StaticColors.transparent;
  Color get kzColor => StaticColors.kzColor;
  Color get grey => StaticColors.gray;
  Color get gradientGray => StaticColors.gradientGray;
}
