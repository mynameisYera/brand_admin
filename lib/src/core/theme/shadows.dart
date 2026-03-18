part of 'theme.dart';

abstract class StaticShadows {
  static final main = BoxShadow(
      blurRadius: 12,
      spreadRadius: 0,
      offset: const Offset(4, 4),
      color: StaticColors.black.withOpacity(0.15));
}
