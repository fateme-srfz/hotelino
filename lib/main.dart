import 'package:Hotelino/core/theme/app_theme.dart';
import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvidr, child) {
        return MaterialApp(
          theme: themeModeProvidr.brightness ==Brightness.light ?
          AppTheme.LightTheme : 
          AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  themeModeProvidr.toggleTheme();
                },
                child: Text('Change Theme'),
              ),
            ),
          ),
        );
      },
    );
  }
}
