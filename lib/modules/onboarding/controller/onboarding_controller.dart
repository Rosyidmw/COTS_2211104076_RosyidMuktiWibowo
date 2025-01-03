import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class OnboardingController extends GetxController {
  final pageController = PageController();
  final RxInt currentPage = 0.obs;

  final onboardingItems = [
    OnboardingItem(
      imagePath: 'assets/onboarding1.png',
      title: 'Selamat Datang di Gojek',
      description: 'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhan mu, kapanpun, dan di manapun',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding2.png',
      title: 'Transportasi & Logistik',
      description: 'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding3.png',
      title: 'Pesan Makan & Belanja',
      description: 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  bool get isLastPage => currentPage.value == onboardingItems.length - 1;


  void onSkipPressed() {
    // Skip to the last page
    pageController.animateToPage(
      onboardingItems.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
