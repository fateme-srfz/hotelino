import 'package:Hotelino/features/home/data/models/homepage_data.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrlImage =
      "http://old.dunijet.ir/content/projects/hotelino/";
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
  static const Color darkInputFill = Color(0xFF303030);
  static const Color darkBorder = Color(0xFF707070);
  static const Color darkFocusedBorder = Colors.brown;
  static const Color darkButton = Color(0xFF5D4037);
}

class HomePageDataConstants {
  static const List<String> _favoriteHotelIds = ["1", "3", "5", "7"];
  static const List<String> _discountedHotelIds = ["2", "4", "6", "8"];
  static const List<String> _recentlyViewedIds = ["1", "4", "9"];
  static const List<String> _popularHotelIds = ["3", "6", "9", "10"];
  static const List<String> _specialOfferIds = ["5", "7", "10"];
  static const List<String> _newestHotelIds = ["8", "9", "10"];

  static HomepageData get homePageData => HomepageData(
    favorites: _favoriteHotelIds,
    discounted: _discountedHotelIds,
    recentlyViewed: _recentlyViewedIds,
    popular: _popularHotelIds,
    specialOffers: _specialOfferIds,
    newest: _newestHotelIds,
  );
}
