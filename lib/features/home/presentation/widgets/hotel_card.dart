import 'package:Hotelino/core/utils/network.dart';
import 'package:Hotelino/core/utils/price_formatter.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:Hotelino/features/home/presentation/widgets/animated_favorite_button.dart';
import 'package:Hotelino/features/hotel_detail/presentation/hotel_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  Hotel hotel;
  HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(hotel.id);

    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: HotelDetailScreen(hotelId: hotel.id),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: SizedBox(
        width: 280,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      networkUrl(hotel.images[0]),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: AnimatedFavoriteButton(
                      isFavorite: isFavorite,
                      onTap: () {
                        favoriteProvider.toggleFavoriteHotels(hotel.id);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "${hotel.rating} (${formatPrice(hotel.reviewCount)})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          hotel.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          "${hotel.city} , ${hotel.country}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "از  ${formatPrice(hotel.pricePerNight)} / شب ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'مشاهده و انتخاب اتاق',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
