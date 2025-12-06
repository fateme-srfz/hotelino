import 'package:Hotelino/routes/test.dart';
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
    return [HomePage(), FavoritePage(), BookinPage(), ProfliePage()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        "assets/images/nav_home.svg",
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
    ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [],
      controller: _controller,
      onItemSelected: (value) {},
    );
  }
}
