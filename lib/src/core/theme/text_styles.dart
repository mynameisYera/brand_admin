part of 'theme.dart';

abstract class TextStyles {
  static const simpleText = TextStyle(
      fontSize: 20,
      color: StaticColors.black,
      fontWeight: FontWeight.w500,);
  static const titleMain = TextStyle(
      fontSize: 20,
      color: StaticColors.black,
      fontWeight: FontWeight.w600,);
  static const titleSecondary = TextStyle(
      fontSize: 20,
      color: StaticColors.black,
      fontWeight: FontWeight.w500,);
  static const titleTag = TextStyle(
      fontSize: 14,
      color: StaticColors.black,
      fontWeight: FontWeight.w400,);
}

class AppTextStyles {
  TextStyle get extraTitle => TextStyles.simpleText;

  TextStyle get titleMain => TextStyles.titleMain;

  TextStyle get titleSecondary => TextStyles.titleSecondary;

  TextStyle get titleTag => TextStyles.titleTag;
}

extension TextStyleThemeDataExtension on ThemeData {
  AppTextStyles get textStyles => AppTextStyles();
}
