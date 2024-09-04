import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_care_ex/src/model/medicine_model.dart';
import 'package:health_care_ex/src/pages/medicine_details.dart';

class MedicineShopPage extends StatelessWidget {
  final List<Medicine> medicines = [
    Medicine(
      name: "Paracetamol",
      description: "Used to treat pain and fever.",
      imageUrl:
          "https://cdn.dribbble.com/users/5788501/screenshots/17133412/media/3889417dc49969fbb30ade8276c7f4cb.jpg",
      price: 200,
    ),
    Medicine(
      name: "Ibuprofen",
      description: "Anti-inflammatory and pain reliever.",
      imageUrl:
          "https://www.clickpharma.com.bd/storage/products/g-paracetamol-tablet-500-mg.jpg",
      price: 300,
    ),
    Medicine(
      name: "Aspirin",
      description: "Used to reduce pain, fever, or inflammation.",
      imageUrl:
          "https://images.pexels.com/photos/9407933/pexels-photo-9407933.jpeg",
      price: 400,
    ),
    // Add more medicines here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Shop'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for medicine...',
                  prefixIcon: const Icon(Icons.search, color: Colors.teal),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .23,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
              items: [
                'assets/banner1.webp',
                'assets/banner2.webp',
                'assets/banner3.webp',
                'assets/banner4.webp'
              ].map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              // items: medicines.map((medicine) {
              //   return Builder(
              //     builder: (BuildContext context) {
              //       return GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   MedicineDetailsPage(medicine: medicine),
              //             ),
              //           );
              //         },
              //         child: Container(
              //           width: MediaQuery.of(context).size.width,
              //           margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(15),
              //             image: DecorationImage(
              //               image: NetworkImage(medicine.imageUrl),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           child: Center(
              //             child: Text(
              //               medicine.name,
              //               style: const TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.bold,
              //                 backgroundColor: Colors.black54,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // }).toList(),
            ),
            // Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryWidget(name: "All"),
                  CategoryWidget(name: "Pain Relief"),
                  CategoryWidget(name: "Cough & Cold"),
                  CategoryWidget(name: "Vitamins"),
                  CategoryWidget(name: "First Aid"),
                ],
              ),
            ),
            // Medicine List
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                'Popular Medicines',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3,
              ),
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MedicineDetailsPage(medicine: medicine),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                            child: Image.network(
                              medicine.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                medicine.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "BDT ${medicine.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String name;

  const CategoryWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
