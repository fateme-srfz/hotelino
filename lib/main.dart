import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter app',
      home: Scaffold(
        appBar: AppBar(title: Text('Hotelino')),
        body: Center(
          child: Text('hello world', style: GoogleFonts.sail(fontSize: 30)),
        ),
      ),
    );
  }
}
