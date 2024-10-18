import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app_colors.dart';

ThemeData appLightTheme() {
  final ThemeData base = ThemeData(
    fontFamily: 'Fresca',
    brightness: Brightness.light,
  );
  return base.copyWith(
    colorScheme: _lightColorScheme,
    primaryColor: _lightColorScheme.primary,
    dividerTheme: _darkDividerThemeData,
    scaffoldBackgroundColor: _lightColorScheme.onPrimary,
    textTheme: _lightTextTheme(),
    primaryTextTheme: _lightTextTheme().apply(
      fontFamily: 'Fresca',
      bodyColor: _lightColorScheme.outline,
      displayColor: _lightColorScheme.outline,
    ),
    inputDecorationTheme: _lightInputDecorationTheme,
    elevatedButtonTheme: _lightElevatedButtonThemeData,
    textButtonTheme: _lightTextButtonThemeData,
    iconTheme: _lightIconThemeData,
    primaryIconTheme: _lightIconThemeData,
    appBarTheme: _lightAppBarTheme,
    bottomAppBarTheme: _lightBottomAppBarTheme,
    bottomNavigationBarTheme: _lightBottomNavigationBarThemeData,
    floatingActionButtonTheme: _lightFloatingActionButtonTheme,
    radioTheme: _lightRadioThemeData,
    switchTheme: _lightSwitchThemeData,
    checkboxTheme: _lightCheckBoxThemeData,
    textSelectionTheme: _lightTextSelectionThemeData,
    tabBarTheme: _lightTabBarTheme,
    dialogTheme: _lightDialogTheme,
    cardTheme: _lightCardTheme,
    chipTheme: _lightChipThemeData,
    bottomSheetTheme: _lightBottomSheetThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    drawerTheme: DrawerThemeData(
      surfaceTintColor: _lightColorScheme.onSecondary,
      backgroundColor: _lightColorScheme.onSecondary,
    ),
  );
}

ThemeData appDarkTheme() {
  final ThemeData base = ThemeData(
    fontFamily: 'Fresca',
    brightness: Brightness.dark,
  );
  return base.copyWith(
    colorScheme: _darkColorScheme,
    primaryColor: _darkColorScheme.primary,
    dividerTheme: _darkDividerThemeData,
    scaffoldBackgroundColor: _darkColorScheme.onSecondary,
    textTheme: _darkTextTheme(),
    primaryTextTheme: _darkTextTheme().apply(
      fontFamily: 'Fresca',
      bodyColor: _darkColorScheme.outline,
      displayColor: _darkColorScheme.outline,
    ),
    inputDecorationTheme: _darkInputDecorationTheme,
    elevatedButtonTheme: _darkElevatedButtonThemeData,
    textButtonTheme: _darkTextButtonThemeData,
    iconTheme: _darkIconThemeData,
    primaryIconTheme: _darkIconThemeData,
    appBarTheme: _darkAppBarTheme,
    bottomAppBarTheme: _darkBottomAppBarTheme,
    bottomNavigationBarTheme: _darkBottomNavigationBarThemeData,
    floatingActionButtonTheme: _darkFloatingActionButtonTheme,
    radioTheme: _darkRadioThemeData,
    switchTheme: _darkSwitchThemeData,
    checkboxTheme: _darkCheckBoxThemeData,
    textSelectionTheme: _darkTextSelectionThemeData,
    tabBarTheme: _darkTabBarTheme,
    dialogTheme: _darkDialogTheme,
    cardTheme: _darkCardTheme,
    chipTheme: _darkChipThemeData,
    bottomSheetTheme: _darkBottomSheetThemeData,
    drawerTheme: DrawerThemeData(
      surfaceTintColor: _darkColorScheme.onSecondary,
      backgroundColor: _darkColorScheme.onSecondary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const ColorScheme _lightColorScheme = ColorScheme.light(
  primary: primary,
  secondary: secondary,
  tertiary: LightInactive1,
  error: Danger,
  brightness: Brightness.light,
  onSecondary: onSecondary,
  onPrimary: onPrimary,
  primaryFixed: onPrimary,
  onPrimaryFixed: primary,
  secondaryContainer: secondaryContainer,
  onSecondaryContainer: onSecondaryContainer,
  outline: primaryText,
);

const ColorScheme _darkColorScheme = ColorScheme.dark(
  primary: primaryDark,
  secondary: secondaryDark,
  tertiary: LightInactive1,
  error: Danger,
  brightness: Brightness.dark,
  onPrimary: onPrimaryDark,
  onSecondary: onSecondaryDark,
  primaryFixed: primaryDark,
  onPrimaryFixed: onPrimaryDark,
  secondaryContainer: secondaryContainerDark,
  onSecondaryContainer: onSecondaryContainerDark,
  outline: primaryDark,
);

DividerThemeData _darkDividerThemeData =
    DividerThemeData(color: _darkColorScheme.secondary);

final BottomSheetThemeData _lightBottomSheetThemeData = BottomSheetThemeData(
    elevation: 0.0,
    backgroundColor: _lightColorScheme.secondary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))));

final BottomSheetThemeData _darkBottomSheetThemeData = BottomSheetThemeData(
    elevation: 0.0,
    backgroundColor: _darkColorScheme.secondary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))));

final ChipThemeData _lightChipThemeData = ChipThemeData(
  elevation: 0.0,
  backgroundColor: _lightColorScheme.secondary,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  disabledColor: const Color.fromRGBO(255, 255, 255, 0.12),
  selectedColor: const Color.fromRGBO(255, 255, 255, 0.12),
  secondarySelectedColor: const Color.fromRGBO(255, 255, 255, 0.12),
  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  labelStyle: _lightTextTheme().bodyMedium,
  secondaryLabelStyle: _lightTextTheme().bodyMedium,
  brightness: Brightness.dark,
);

final ChipThemeData _darkChipThemeData = ChipThemeData(
  elevation: 0.0,
  backgroundColor: _darkColorScheme.secondary,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  disabledColor: Color.fromARGB(30, 164, 213, 26),
  selectedColor: _darkColorScheme.secondary,
  secondarySelectedColor: Color.fromARGB(30, 38, 46, 206),
  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
  labelStyle: _darkTextTheme().bodyMedium,
  secondaryLabelStyle: _darkTextTheme().bodyMedium,
  brightness: Brightness.dark,
);

final CardTheme _lightCardTheme = CardTheme(
    elevation: 0.4,
    color: _lightColorScheme.secondary,
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)));

final CardTheme _darkCardTheme = CardTheme(
    elevation: 0.4,
    color: _darkColorScheme.secondary,
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)));

final DialogTheme _lightDialogTheme = DialogTheme(
  backgroundColor: _lightColorScheme.secondary,
  elevation: 0.0,
  titleTextStyle: _lightTextTheme().titleSmall,
  contentTextStyle: _lightTextTheme().bodyMedium,
);

final DialogTheme _darkDialogTheme = DialogTheme(
  backgroundColor: _darkColorScheme.secondary,
  elevation: 0.0,
  titleTextStyle: _darkTextTheme().titleSmall,
  contentTextStyle: _darkTextTheme().bodyMedium,
);

TabBarTheme _lightTabBarTheme = TabBarTheme(
  labelColor: _lightColorScheme.onPrimary,
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: _lightColorScheme.secondary,
  indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: _lightColorScheme.secondary, width: 2.0)),
);

TabBarTheme _darkTabBarTheme = TabBarTheme(
  labelColor: _darkColorScheme.onPrimary,
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: _darkColorScheme.secondary,
  indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: _darkColorScheme.secondary, width: 2.0)),
);

TextSelectionThemeData _lightTextSelectionThemeData = TextSelectionThemeData(
    cursorColor: _lightColorScheme.primary,
    selectionHandleColor: _lightColorScheme.primary,
    selectionColor: _lightColorScheme.primary.withOpacity(0.5));
TextSelectionThemeData _darkTextSelectionThemeData = TextSelectionThemeData(
    cursorColor: _darkColorScheme.onPrimary,
    selectionHandleColor: _darkColorScheme.onPrimary,
    selectionColor: _darkColorScheme.onPrimary.withOpacity(0.5));

final SwitchThemeData _lightSwitchThemeData = SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(_lightColorScheme.onSecondary));
final SwitchThemeData _darkSwitchThemeData = SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(_lightColorScheme.secondary));

final CheckboxThemeData _lightCheckBoxThemeData = CheckboxThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  checkColor: WidgetStateProperty.all<Color>(Colors.black),
);

final CheckboxThemeData _darkCheckBoxThemeData = CheckboxThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  checkColor: WidgetStateProperty.all<Color>(Colors.white),
);

FloatingActionButtonThemeData _lightFloatingActionButtonTheme =
    FloatingActionButtonThemeData(
        elevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        highlightElevation: 0.0,
        splashColor: _lightColorScheme.primary,
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.outline);

FloatingActionButtonThemeData _darkFloatingActionButtonTheme =
    FloatingActionButtonThemeData(
        elevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        highlightElevation: 0.0,
        splashColor: _darkColorScheme.secondaryContainer,
        backgroundColor: _darkColorScheme.onSecondary,
        foregroundColor: _darkColorScheme.outline);

IconThemeData _lightIconThemeData =
    IconThemeData(color: _lightColorScheme.secondary);
IconThemeData _darkIconThemeData =
    IconThemeData(color: _darkColorScheme.secondary);

final AppBarTheme _lightAppBarTheme = AppBarTheme(
  elevation: 0.0,
  centerTitle: false,
  backgroundColor: _lightColorScheme.secondary,
  titleTextStyle: _lightTextTheme().titleMedium,
  iconTheme: IconThemeData(color: _lightColorScheme.outline),
);

final AppBarTheme _darkAppBarTheme = AppBarTheme(
  elevation: 0.0,
  centerTitle: false,
  backgroundColor: _darkColorScheme.onPrimary,
  titleTextStyle: _darkTextTheme().titleMedium,
  iconTheme: IconThemeData(color: _darkColorScheme.outline),
);

final BottomAppBarTheme _lightBottomAppBarTheme =
    BottomAppBarTheme(elevation: 0.4, color: _lightColorScheme.secondary);
final BottomAppBarTheme _darkBottomAppBarTheme =
    BottomAppBarTheme(elevation: 0.4, color: _darkColorScheme.secondary);

final BottomNavigationBarThemeData _lightBottomNavigationBarThemeData =
    BottomNavigationBarThemeData(
        elevation: 0.0,
        selectedItemColor: _lightColorScheme.primary,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _lightColorScheme.onSecondary,
        unselectedItemColor: _lightColorScheme.secondary,
        selectedIconTheme: IconThemeData(color: _lightColorScheme.primary),
        unselectedIconTheme:
            IconThemeData(color: _lightColorScheme.secondary));

final BottomNavigationBarThemeData _darkBottomNavigationBarThemeData =
    BottomNavigationBarThemeData(
        elevation: 0.0,
        selectedItemColor: PurpleLight,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _darkColorScheme.onSecondary,
        unselectedItemColor: _darkColorScheme.primary,
        selectedIconTheme: const IconThemeData(color: PurpleLight ),
        unselectedIconTheme: IconThemeData(color: _darkColorScheme.primary));

InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 36.0, top: 2.5),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: _lightColorScheme.secondary)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _lightColorScheme.secondary)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _lightColorScheme.primary)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)),
    focusedErrorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Danger)));

InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 36.0, top: 2.5),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: _darkColorScheme.secondary)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _darkColorScheme.secondary)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: _darkColorScheme.primary)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Danger)),
    focusedErrorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Danger)));

final ElevatedButtonThemeData _lightElevatedButtonThemeData =
    ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(0.0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            overlayColor:
                WidgetStateProperty.all<Color>(_lightColorScheme.primary),
            textStyle: WidgetStateProperty.all<TextStyle>(_lightTextTheme()
                    .labelMedium
                    ?.copyWith(color: _lightColorScheme.primary) ??
                const TextStyle()),
            backgroundColor:
                WidgetStateProperty.all<Color>(_lightColorScheme.primary),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))));

final ElevatedButtonThemeData _darkElevatedButtonThemeData =
    ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(0.0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            overlayColor:
                WidgetStateProperty.all<Color>(_darkColorScheme.primary),
            textStyle: WidgetStateProperty.all<TextStyle>(_lightTextTheme()
                    .labelMedium
                    ?.copyWith(color: _darkColorScheme.primary) ??
                const TextStyle()),
            backgroundColor:
                WidgetStateProperty.all<Color>(_darkColorScheme.primary),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)))));

final TextButtonThemeData _lightTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final TextButtonThemeData _darkTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))));

final RadioThemeData _lightRadioThemeData = RadioThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  overlayColor: WidgetStateProperty.all<Color>(LightInactive1),
  fillColor: WidgetStateProperty.all<Color>(const Color(0xffC1C1C1)),
);

final RadioThemeData _darkRadioThemeData = RadioThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  overlayColor: WidgetStateProperty.all<Color>(_darkColorScheme.onPrimary),
  fillColor: WidgetStateProperty.all<Color>(const Color(0xffC1C1C1)),
);

TextTheme _lightTextTheme() {
  final base = ThemeData.light().textTheme;
  return base
      .copyWith(
          displayMedium: base.displayMedium?.copyWith(
              fontSize: 96,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          headlineLarge: base.headlineLarge?.copyWith(
              fontSize: 60,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          headlineMedium: base.headlineMedium?.copyWith(
              fontSize: 48,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          headlineSmall: base.headlineSmall?.copyWith(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          titleLarge: base.titleLarge?.copyWith(
              fontSize: 28,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          titleMedium: base.titleMedium?.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          titleSmall: base.titleSmall?.copyWith(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          bodyLarge: base.bodyLarge?.copyWith(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          bodyMedium: base.bodyMedium?.copyWith(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodySmall: base.bodySmall?.copyWith(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelLarge: base.labelLarge?.copyWith(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          labelMedium: base.labelMedium?.copyWith(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelSmall: base.labelSmall?.copyWith(
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3))
      .apply(
          fontFamily: 'Fresca',
          displayColor: _lightColorScheme.outline,
          bodyColor: _lightColorScheme.outline);
}

TextTheme _darkTextTheme() {
  final base = ThemeData.dark().textTheme;
  return base
      .copyWith(
          displayMedium: base.displayMedium?.copyWith(
              fontSize: 96,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          headlineLarge: base.headlineLarge?.copyWith(
              fontSize: 60,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          headlineMedium: base.headlineMedium?.copyWith(
              fontSize: 48,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          headlineSmall: base.headlineSmall?.copyWith(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300),
          titleLarge: base.titleLarge?.copyWith(
              fontSize: 28,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          titleMedium: base.titleMedium?.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          titleSmall: base.titleSmall?.copyWith(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          bodyLarge: base.bodyLarge?.copyWith(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          bodyMedium: base.bodyMedium?.copyWith(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodySmall: base.bodySmall?.copyWith(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelLarge: base.labelLarge?.copyWith(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          labelMedium: base.labelMedium?.copyWith(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelSmall: base.labelSmall?.copyWith(
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3))
      .apply(
          fontFamily: 'Fresca',
          displayColor: _darkColorScheme.outline,
          bodyColor: _darkColorScheme.outline);
}
