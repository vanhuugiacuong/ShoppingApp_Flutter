import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:flutter_buoi5/sections/productsection.dart';
import 'package:flutter_buoi5/widgets/custom_bottom_nav.dart';

final List<Shoe> data = [
  Shoe(
    id: '1',
    name: "Nike Air Force 1 '07",
    price: 115,
    imageUrl:
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/AIR+FORCE+1+%2707.png",
    description:
        "Classic and timeless, the Nike Air Force 1 '07 is a must-have in any sneaker collection. With its clean lines and premium materials, it offers both style and comfort.",
  ),
  Shoe(
    id: '2',
    name: "Nike Vista",
    price: 60,
    imageUrl:
        "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/64d54bbd-0fa3-4201-bf8e-0bb302e83f76/NIKE+VISTA+SANDAL.png",
    description:
        "The Nike Vista Sandal combines comfort and style with its adjustable straps and cushioned footbed. Perfect for casual outings or lounging by the pool.",
  ),
  Shoe(
    id: '3',
    name: "Nike Cortez Leather",
    price: 130,
    imageUrl:
        "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/db838aa6-9440-4e42-adf5-81b9141aec37/NIKE+CORTEZ.png",
    description:
        "The Nike Nike Cortez Leather stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU accents.",
  ),
  Shoe(
    id: '4',
    name: "Nike Air Max 90",
    price: 120,
    imageUrl:
        "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/fb902d98-985a-4968-8427-1cea006d12ee/WMNS+AIR+MAX+90.png",
    description:
        "Nike Air Max 90 stays true to its roots with the iconic Waffle sole, stitched overlays and classic TPU accents. Fresh details give a modern look while Max Air cushioning adds comfort to your journey.",
  ),
  // Add more shoe data here
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark background
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFF1DB954), // Spotify green
          centerTitle: true,
          title: const Text('Home Page', style: TextStyle(color: Colors.white)),
          shape: const RoundedRectangleBorder(
           
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                // Navigate to settings
              },
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Implement search
              },
            ),
          ),
        ),
      ),
      // body: SizedBox(
      //   height: 320,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: data.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(8),
      //         child: AspectRatio(
      //           aspectRatio: 0.7, // width:height (ví dụ: 2:3 là 200x300)
      //           child: CustomProductCard(shoe: data[index]),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductSection(title: "Trendy", products: data),
            ProductSection(title: "Popular",products: data),
            ProductSection(title: "New Arrivals", products: data),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
