import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final onboardingDataList = onboardingProvider.onbordingDataList;
    final int totalPge = onboardingDataList.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPge,
              onPageChanged: onboardingProvider.updateCurrenIndex,
              itemBuilder: (context, index) {
                final data = onboardingDataList[index];
                return OnboardingItem(
                  image: data['image']!,
                  title: data['title']!,
                  description: data['description']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
