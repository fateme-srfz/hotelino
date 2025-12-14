import 'package:Hotelino/core/utils/network.dart';
import 'package:Hotelino/core/utils/price_formatter.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:flutter/material.dart';

class HotelCardVertical extends StatelessWidget {
  final Hotel hotel;
  const HotelCardVertical({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 2,
            )
          else
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHigh.withValues(alpha: 1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('رزرو اتاق', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${hotel.city}, ${hotel.country}'),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text("${hotel.bedType.count}, ${hotel.bedType.type}"),
                      Text(
                        " ${hotel.bedType.count} ${hotel.bedType.details}",
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.bed,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'از ${formatPrice(hotel.pricePerNight)} / شب',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.network(
              networkUrl(hotel.images[0]),
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
