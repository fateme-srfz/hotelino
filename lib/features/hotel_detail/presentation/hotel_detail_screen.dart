import 'package:Hotelino/core/utils/network.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:Hotelino/shared/services/json_data_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    final hotelRepository = HotelRepository(jsonDataService: JsonDataService());
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder<Hotel>(
      future: hotelRepository.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final hotel = snapshot.data!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onLongPress: () {},
                    child: Image.network(
                      networkUrl(hotel.images.first),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                elevation: 8,
                expandedHeight: 300,
                leading: IconButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotel.name,
                        style: textTheme.headlineMedium,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              hotel.address,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'امکانات رفاهی',
                        style: textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 14,
                        children: hotel.amenities.map((a) {
                          IconData icon;

                          switch (a) {
                            case 'ساحل':
                              icon = Icons.beach_access;
                              break;

                            case 'استخر':
                              icon = Icons.pool;
                              break;

                            case 'باشگاه':
                              icon = Icons.fitness_center;
                              break;

                            case 'کافه':
                              icon = Icons.restaurant;
                              break;

                            case 'رستوران':
                              icon = Icons.restaurant;
                              break;

                            case 'کولر':
                              icon = Icons.ac_unit;
                              break;

                            default:
                              icon = Icons.check_circle_outline;
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(icon, size: 30, color: Colors.grey),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                a,
                                style: textTheme.bodySmall!.copyWith(
                                  color: Colors.black87,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "گالری تصاویر",
                        style: textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          itemCount: hotel.images.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      networkUrl(hotel.images[index]),
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                if (index != 0) const SizedBox(width: 8),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'توضیحات',
                        style: textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        hotel.description,
                        style: textTheme.bodyMedium!.copyWith(height: 1.5),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
