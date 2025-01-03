import 'package:cots_rosyidmuktiwibowo/modules/main/controller/home_controller.dart';
import 'package:cots_rosyidmuktiwibowo/modules/main/view/order_screen.dart';
import 'package:cots_rosyidmuktiwibowo/modules/main/view/promo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    HomeContent(), // Konten Home utama
    PromoScreen(),
    OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promos'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          ],
        );
      }),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find services, food, or places',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Navigate to profile
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // GoPay Section
          Container(
            child: Image.asset('assets/gopay.png'),
          ),
          SizedBox(height: 16),
          // Menu Grid
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 1,
            children: [
              _buildMenuItem('GoRide', 'assets/go-ride.png'),
              _buildMenuItem('GoCar', 'assets/go-car.png'),
              _buildMenuItem('GoFood', 'assets/go-food.png'),
              _buildMenuItem('GoSend', 'assets/go-send.png'),
              _buildMenuItem('GoMart', 'assets/go-mart.png'),
              _buildMenuItem('GoPulsa', 'assets/go-pulsa.png'),
              _buildMenuItem('GoClub', 'assets/go-point.png'),
              _buildMenuItem('More', 'assets/lainnya.png'),
            ],
          ),
          SizedBox(height: 16),
          // Promo Section
        ],)
    );
  }
  Widget _buildIconButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuItem(String label, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset( imagePath, height: 40, width: 40, ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
