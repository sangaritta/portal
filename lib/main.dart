import 'package:flutter/cupertino.dart';
import 'package:portal/Screens/Home/home_screen.dart';
import 'package:portal/Services/theme_provider.dart';
import 'package:portal/Screens/Home/sidebar_menu.dart';
import 'package:portal/Screens/Login/login_screen.dart';
import 'package:portal/Services/auth_service.dart';
import 'Constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    initializeDateFormatting().then((_) async {
      final themeProvider = ThemeProvider();
      await themeProvider.loadThemeMode(); // Cargar el modo de tema
      runApp(
        ChangeNotifierProvider(
          create: (context) => themeProvider,
          child: const MyApp(),
        ),
      );
    });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal',
      theme: Themes.lightTheme, // Usa el tema claro predeterminado de Flutter
      darkTheme:
          Themes.darkTheme, // Usa el tema oscuro predeterminado de Flutter
      themeMode: themeProvider.themeMode, // Usa el modo de tema del proveedor
      home: const AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: auth
          .authStatus(), // Call your authStatus function to check if the user is signed in.
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or some other widget while checking the user's status.
          return const Center(
            child: CupertinoActivityIndicator(),
          ); // You can replace this with a better loading widget.
        } else if (snapshot.hasData && snapshot.data == true) {
          // The user is signed in.
          return const HomeScreen();
        } else {
          // The user is not signed in.
          return const LoginScreen();
        }
      },
    );
  }
}
