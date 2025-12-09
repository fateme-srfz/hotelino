import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:flutter/material.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;
  FavoriteItemProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<Hotel> _hotels = [];
  final List<String> _favoriteHotelIds = [];
  List<Hotel> get favoriteHotelList =>
      _hotels.where((hotel) => _favoriteHotelIds.contains(hotel.id)).toList();

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  bool isFavorite(String hotelId) {
    return _favoriteHotelIds.contains(hotelId);
  }

  void toggleFavoriteHotels(String hotelId) {
    if (_favoriteHotelIds.contains(hotelId)) {
      _favoriteHotelIds.remove(hotelId);
    } else {
      _favoriteHotelIds.add(hotelId);
    }
    notifyListeners();
  }
}
