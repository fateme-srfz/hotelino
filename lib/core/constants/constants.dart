import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrlImage =
      "http://dunijet.ir/content/projects/hotelino/";
  static const String hotelsData = "assets/data/hotels.json";
}

class AppColors {
  static const Color primary = Color(0xFFB27258);

  //Light Theme Colors
  static const Color lightText = Colors.black;
  static const Color lightHint = Color(0xFF9196A3);
  static const Color lightInputFill = Color(0xFFF5F5F5);
  static const Color lightBorder = Color(0xFF9196A3);
  static const Color lightFocusedBorder = Colors.brown;

  //Dark Theme Colors
  static const Color darkText = Colors.white;
  static const Color darkHint = Color(0xFF9196A3);
  static const Color darkInputFill = Color(0xFFF5F5F5);
  static const Color darkBorder = Color(0xFF707070);
  static const Color darkFocusedBorder = Colors.brown;
  static const Color darkButton = Color(0xFF5D4037);
}
