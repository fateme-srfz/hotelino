import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/presentation/widgets/hotel_card.dart';
import 'package:flutter/material.dart';

class HotelListSection extends StatelessWidget {
  final String title;
  final List<Hotel> hotelsList;
  final VoidCallback? onSeeAllPressed;

  const HotelListSection({
    super.key,
    required this.title,
    required this.hotelsList,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'مشاهده همه',
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
              Text(title, style: theme.textTheme.displayMedium),
            ],
          ),
        ),
        SizedBox(
          height: 360,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16),
            reverse: true,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: hotelsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: HotelCard(hotel: hotelsList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
