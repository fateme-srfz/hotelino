import 'package:Hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:Hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: HomeAppbar(), 
      body: Center());
  }
}
