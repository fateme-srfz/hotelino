import 'package:Hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:Hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:Hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:Hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:Hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:Hotelino/features/home/presentation/widgets/story_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            SearchBarWidget(),
            const SizedBox(height: 16),
            AdBannerWidget(),
            Consumer<HomeProvider>(
              builder: (context, homeprovider, child) {
                return HotelListSection(
                  title: 'محبوب ترین هتل ها',
                  hotelsList: homeprovider.getPopularHotels(),
                  onSeeAllPressed: () {},
                );
              },
            ),

            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: "پیشنهاد ویژه امروز",
                  hotelsList: homeProvider.getSpecialOffersHotels(),
                  onSeeAllPressed: () {},
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryImages(), 
                  titles: homeProvider.storyTitles);
              },
            ),
          ],
        ),
      ),
    );
  }
}
