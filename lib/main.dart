import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:sih/auth/frontpage/frontpage.dart';
import 'package:sih/core/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load .env file from the assets directory
    await dotenv.load(fileName: 'assets/.env');

    // Initialize Firebase
    await Firebase.initializeApp();

    // Run the app with Riverpod's ProviderScope
    runApp(const ProviderScope(child: MyApp()));
  } catch (e) {
    // Handle errors related to dotenv or app initialization
    String errorMessage;
    if (e is PlatformException) {
      errorMessage = 'Platform error: ${e.message}';
    } else if (e is FirebaseException) {
      errorMessage = 'Firebase error: ${e.message}';
    } else if (e is Exception) {
      errorMessage = 'Exception: ${e.toString()}';
    } else {
      errorMessage = 'Unexpected error: ${e.toString()}';
    }

    // Log the error message to the console
    print('Error initializing the app: $errorMessage');

    // Optionally, show an error message to the user or handle it in another way
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Error initializing the app. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aapdarthi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const Frontpage(),
    );
  }
}
