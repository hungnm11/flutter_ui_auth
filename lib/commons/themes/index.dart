import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: Color(0xffEDD5B3),
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Color(0x1aF5E0C3),
  primaryColorDark: Color(0xff936F3E),
  canvasColor: Color(0xffE09E45),
  scaffoldBackgroundColor: Color(0xffB5BFD3),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xaaF5E0C3),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color(0x1aF5E0C3),
  hoverColor: Color(0xffDEC29B),
  highlightColor: Color(0xff936F3E),
  splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  selectedRowColor: Colors.grey,
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: ButtonThemeData(
      //button themes
      ),
  toggleButtonsTheme: ToggleButtonsThemeData(
      //toggle button theme
      ),
  secondaryHeaderColor: Colors.grey,
  backgroundColor: Color(0xff457BE0),
  dialogBackgroundColor: Colors.white,
  indicatorColor: Color(0xff457BE0),
  hintColor: Colors.grey,
  errorColor: Colors.red,
  toggleableActiveColor: Color(0xff6D42CE),
  textTheme: TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: TextTheme(
      //text theme that contrast with primary color
      ),
  inputDecorationTheme: InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: IconThemeData(
      //icon themes that contrast primary color
      ),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
    0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1aF5E0C3),
      100: Color(0xa1F5E0C3),
      200: Color(0xaaF5E0C3),
      300: Color(0xafF5E0C3),
      400: Color(0xffF5E0C3),
      500: Color(0xffEDD5B3),
      600: Color(0xffDEC29B),
      700: Color(0xffC9A87C),
      800: Color(0xffB28E5E),
      900: Color(0xff936F3E)
    },
  )).copyWith(secondary: Color(0xff457BE0)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff936F3E),
    selectionColor: Color(0xffB5BFD3),
    selectionHandleColor: Color(0xff936F3E),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    0xFFF51D15,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06)
    },
  ),
  primaryColor: Color(0xff5D4524),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color(0x1a311F06),
  primaryColorDark: Color(0xff936F3E),
  canvasColor: Color(0xffE09E45),
  accentColor: Color(0xFF589B38),
  accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF2769EC),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xaa311F06),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color(0x1a311F06),
  hoverColor: Color(0xa15D4524),
  highlightColor: Color(0xaf2F1E06),
  splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  selectedRowColor: Colors.grey,
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: ButtonThemeData(
//button themes
      ),
  toggleButtonsTheme: ToggleButtonsThemeData(
//toggle button theme
      ),
  buttonColor: Color(0xff483112),
  secondaryHeaderColor: Colors.grey,
  textSelectionColor: Color(0x1a483112),
  cursorColor: Color(0xff483112),
  textSelectionHandleColor: Color(0xff483112),
  backgroundColor: Color(0xFFE04545),
  dialogBackgroundColor: Colors.white,
  indicatorColor: Color(0xff457BE0),
  hintColor: Colors.grey,
  errorColor: Colors.red,
  toggleableActiveColor: Color(0xff6D42CE),
  textTheme: TextTheme(
//text themes that contrast with card and canvas
      ),
  primaryTextTheme: TextTheme(
//text theme that contrast with primary color
      ),
  accentTextTheme: TextTheme(
//text theme that contrast with accent Color
      ),
  inputDecorationTheme: InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: IconThemeData(
//icon themes that contrast with card and canvas
      ),
  primaryIconTheme: IconThemeData(
//icon themes that contrast primary color
      ),
  accentIconTheme: IconThemeData(
//icon themes that contrast accent color
      ),
);
