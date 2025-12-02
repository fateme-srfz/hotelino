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
          const SizedBox(height: 20),
          buildPageIndicator(
            onboardingProvider.currentIndex,
            totalPge,
            context,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildPageIndicator(
    int currentIndex,
    int totalPages,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(microseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 8,
          height: currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withAlpha(30),
          ),
        ),
      ),
    );
  }
}
