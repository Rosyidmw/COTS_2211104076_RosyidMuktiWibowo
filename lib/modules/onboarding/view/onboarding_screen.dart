import 'package:cots_rosyidmuktiwibowo/design_system/color_collections.dart';
import 'package:cots_rosyidmuktiwibowo/modules/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cots_rosyidmuktiwibowo/design_system/typography_collections.dart';
import 'package:cots_rosyidmuktiwibowo/modules/onboarding/controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo/logo_gojek.png', height: 40),
                  Image.asset('assets/logo/lang.png', height: 40),
                ],
              ),
              const SizedBox(height: 16),
              // PageView
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.onboardingItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.onboardingItems[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.imagePath, height: 250),
                        const SizedBox(height: 24),
                        Text(item.title, style: TypographyCollections.h3, textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        Text(item.description,
                            style: TypographyCollections.paragraph1, textAlign: TextAlign.center),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Indicator
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onboardingItems.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentPage == index
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              // Buttons
              ElevatedButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: Text('Masuk', style: TextStyle(color: ColorCollections.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCollections.green,
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {},
                child: Text('Belum ada akun?, Daftar dulu', style: TextStyle(color: ColorCollections.green),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCollections.white,
                ),
              ),
              const SizedBox(height: 20),
              Text('Dengan masuk atau mendaftar, kamu menyetujui'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Ketentuan layanan', style: TextStyle(color: ColorCollections.primaryBlue),),
                  Text(' dan ', style: TextStyle(color: ColorCollections.black),),
                  Text('Kebijakan Privasi', style: TextStyle(color: ColorCollections.primaryBlue),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
