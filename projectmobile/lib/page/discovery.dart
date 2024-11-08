import 'package:flutter/material.dart';



class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  int _currentBannerIndex = 0;
  final List<String> bannerImages = [
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
  ];

  final List<String> categories = [
    'All Categories',
    'On Sale',
    "Men's",
    "Women's",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Discovery",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 200,
              child: PageView.builder(
                itemCount: bannerImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentBannerIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return BannerImage(
                    imageUrl: bannerImages[index],
                    title: 'Banner ${index + 1}',
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(bannerImages.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentBannerIndex == index
                          ? Colors.teal
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categories[index],
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Popular Product 1',
                    price: '29.99',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Popular Product 2',
                    price: '49.99',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Popular Product 3',
                    price: '59.99',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'On Sale',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Sale Product 1',
                    price: '19.99',
                    originalPrice: '29.99',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Sale Product 2',
                    price: '39.99',
                    originalPrice: '59.99',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Sale Product 3',
                    price: '24.99',
                    originalPrice: '34.99',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BannerImage({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover),
        Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String? originalPrice;

  const ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: 14, color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                if (originalPrice != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$$originalPrice',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
