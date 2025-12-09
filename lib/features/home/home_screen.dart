import 'package:Hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:Hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:Hotelino/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: HomeAppbar(), 
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16,),
            SearchBarWidget(),
            const SizedBox(height: 16,),
            

          ],
        ),

      )
      );
  }
}
