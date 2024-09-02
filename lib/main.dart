// import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih/auth/frontpage/frontpage.dart';
import 'package:sih/core/themes/themes.dart';

/// The main application widget for the Flutter demo.
///
/// This widget sets up the MaterialApp and specifies the home page to be the
/// SignupPage.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const Frontpage(),
    );
  }
}

/// The entry point for the Flutter demo application.
///
/// This function sets up the application by calling `runApp` with an instance
/// of the `MyApp` widget.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load .env file directly from the path
    await dotenv.load(fileName: 'assets/.env');

    runApp(ProviderScope(child: MyApp()));
  } catch (e) {
    print('Error loading .env file: $e');
  }
}


// .\venv\Scripts\activate