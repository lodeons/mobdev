import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  final _pages = const [
    Center(child: Text('Riwayat (Step 2)')),
    Center(child: Text('Statistik (Step 4)')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moodly'),
        actions: [
          IconButton(
            tooltip: 'Ganti tema',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => theme
                .setMode(isDark ? ThemeMode.light : ThemeMode.dark),
          ),
        ],
      ),
      body: IndexedStack(index: _index, children: _pages),
      floatingActionButton: _index == 0
          ? FloatingActionButton.extended(
              onPressed: () {}, // Step 2: buka form
              icon: const Icon(Icons.add),
              label: const Text('Catat Mood'),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.list_alt), label: 'Riwayat'),
          NavigationDestination(
              icon: Icon(Icons.insights), label: 'Statistik'),
        ],
      ),
    );
  }
}