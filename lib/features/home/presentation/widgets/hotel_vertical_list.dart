import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/widgets/hotel_card_vertical.dart';
import 'package:flutter/material.dart';

class HotelVerticalList extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;

  const HotelVerticalList({
    super.key,
    required this.title,
    required this.hotels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: HotelCardVertical(hotel: hotels[index]),
            );
          },
        ),
      ],
    );
  }
}
