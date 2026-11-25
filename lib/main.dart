import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/mood_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/root_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final moodProvider = MoodProvider();
  final themeProvider = ThemeProvider();
  await Future.wait([moodProvider.load(), themeProvider.load()]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: moodProvider),
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: const MoodlyApp(),
    ),
  );
}

class MoodlyApp extends StatelessWidget {
  const MoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF5B45B8);
    return MaterialApp(
      title: 'Moodly',
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().mode,
      theme: ThemeData(
        colorSchemeSeed: seed,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: seed,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const RootScreen(),
    );
  }
}