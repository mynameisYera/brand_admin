import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:brand_admin/src/core/constants/ui_constants.dart';

part 'colors.dart';

part 'shadows.dart';

part 'text_styles.dart';

part 'theme_context_extension.dart';

class MaterialAppTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'PPRadioGrotesk',
    scaffoldBackgroundColor: StaticColors.white,
    splashFactory: kIsWeb ? NoSplash.splashFactory : InkSparkle.splashFactory,
    splashColor: StaticColors.secondary.withOpacity(0.3),
    highlightColor: StaticColors.secondary.withOpacity(0.2),
    dividerTheme: const DividerThemeData(
        color: StaticColors.stroke, thickness: 1, space: 36),
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: StaticColors.white,
        backgroundColor: StaticColors.white,
        surfaceTintColor: StaticColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(UIConstants.defaultGap3)))),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          elevation: 0,
          fixedSize: const Size.fromHeight(44),
          maximumSize: const Size.fromHeight(44),
          backgroundColor: StaticColors.red,
          foregroundColor: StaticColors.white,
          disabledBackgroundColor: StaticColors.background,
          disabledForegroundColor: StaticColors.secondary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIConstants.defaultRadius))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: StaticColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      errorStyle: const TextStyle(height: 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: StaticColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: StaticColors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: StaticColors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    // ====================================

    // ====================================
  );

  static final light = theme.copyWith(
    brightness: Brightness.light,
  );

  static final dark = theme.copyWith(
    brightness: Brightness.dark,
  );
}
