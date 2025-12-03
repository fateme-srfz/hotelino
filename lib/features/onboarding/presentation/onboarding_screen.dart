import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:Hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:Hotelino/routes/app_route.dart';
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
    final int totalPage = onboardingDataList.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPage,
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
            totalPage,
            context,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButton(
                  visible: onboardingProvider.currentIndex > 0,
                  onPressed: () => _previousPage(),
                  icon: Icons.arrow_back,
                  iconColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.transparent,
                ),

                OnboardingButton(
                  visible: onboardingProvider.currentIndex < totalPage - 1,
                  onPressed: () => _nextPage(),
                  icon: Icons.arrow_forward,
                  iconColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (totalPage > 1) ...[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  child: child,
                  sizeFactor: animation,
                  axisAlignment: -1,
                );
              },
              child: onboardingProvider.currentIndex == totalPage - 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,
                            AppRoute.home
                            );
                          },
                          child: Text('شروع رزرو هتل ها'),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ],
      ),
    );
  }

  void _nextPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentIndex <
        onboardingProvider.onbordingDataList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _previousPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
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
