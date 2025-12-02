import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingRepository repository;
  OnboardingProvider(this.repository) {
    _loadData(); 
  }

  int currentIndex = 0;
  List<Map<String, String>> onbordingDataList = [];

  void _loadData() {
    onbordingDataList = repository.onbordingDataList;
    notifyListeners();
  }

  void updateCurrenIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
