import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screen/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the theme for the app with a dark color scheme and Lato font.
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 10, 126, 193),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 10, 126, 193),  // Custom AppBar color
    titleTextStyle: GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color.fromARGB(255, 10, 126, 193),  // Button color
    textTheme: ButtonTextTheme.primary,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Color.fromARGB(255, 10, 126, 193),
    unselectedItemColor: Colors.grey,
  ),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
