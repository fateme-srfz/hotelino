import 'package:Hotelino/core/constants/constants.dart';
import 'package:Hotelino/core/utils/keyboard.dart';
import 'package:Hotelino/features/booking/presentation/booking_screen.dart';
import 'package:Hotelino/features/favorite/presentation/favorite_screen.dart';
import 'package:Hotelino/features/home/presentation/home_screen.dart';
import 'package:Hotelino/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  _buildscreens() {
    return [
      const HomeScreen(), 
      const FavoriteScreen(), 
      BookingScreen(), 
      const ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_home.svg",
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),

        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_home.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),

        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),

        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),

        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildscreens(),
      items: _navBarItems(),
      controller: _controller,

      onItemSelected: (index) {
        if (index != 2) {
          // print('✅we left booking page');
          //reset form on booking screen
          BookingScreen.bookingScreenKey.currentState?.resetForm();
        }
        unfocusEditors(context);
      },

      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style7,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
