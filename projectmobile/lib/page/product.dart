import 'package:flutter/material.dart';
import 'dart:math';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentImageIndex = 0;
  int _selectedRating = 5;
  final _commentController = TextEditingController();

  final List<String> productImages = [
    'https://via.placeholder.com/300', // URL ảnh mẫu
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];

  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Alice Johnson",
      "rating": 5,
      "comment": "This product is amazing! Highly recommended.",
      "date": "2023-11-01"
    },
    {
      "name": "Bob Smith",
      "rating": 4,
      "comment": "Very good quality, but took some time to deliver.",
      "date": "2023-10-25"
    },
    {
      "name": "Clara White",
      "rating": 3,
      "comment": "Average product. Expected more for the price.",
      "date": "2023-10-20"
    },
  ];

  void _addReview() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        reviews.insert(0, {
          "name": "You",
          "rating": _selectedRating,
          "comment": _commentController.text,
          "date": "Today",
        });
      });
      _commentController.clear();
      _selectedRating = 5;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter a comment."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: PageView.builder(
                  itemCount: productImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        productImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(productImages.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentImageIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentImageIndex == index
                          ? Colors.purple
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                "Lipsy London",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                "Sleeveless Ruffle",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Available in stock",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Text("4.6",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(" (120 Reviews)",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Product info",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "A cool gray cap in soft corduroy. Watch me. 'By buying cotton products from Lindex, you’re supporting more responsibly...",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                  Text(
                                    "The Great Gatsby",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Tác giả: F. Scott Fitzgerald",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Thể loại: Tiểu thuyết, Văn học Mỹ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Năm xuất bản: 1925",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Giới thiệu:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "The Great Gatsby là một trong những tiểu thuyết vĩ đại nhất của văn học Mỹ, kể về cuộc sống xa hoa và những mối quan hệ phức tạp của giới thượng lưu tại New York vào những năm 1920. Qua câu chuyện của Jay Gatsby, tác giả đã phơi bày sự suy đồi của giấc mơ Mỹ và sự khát khao về một tình yêu hoàn hảo.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Proceeding to Buy The Great Gatsby!"),
                                        ));
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.info_outline, color: Colors.purple),
                    ),
                    Text(
                      "Shipping Information",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.local_shipping_outlined, color: Colors.purple),
                    SizedBox(width: 10),
                    Text(
                      "Shipping Information",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.restart_alt_outlined, color: Colors.purple),
                    SizedBox(width: 10),
                    Text(
                      "Returns",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Customer Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...reviews.map((review) => _buildReviewCard(review)).toList(),
              SizedBox(height: 20),
              Text(
                "Leave a Review",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Rating:", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 10),
                  DropdownButton<int>(
                    value: _selectedRating,
                    items: List.generate(5, (index) => index + 1)
                        .map((rating) => DropdownMenuItem<int>(
                              value: rating,
                              child:
                                  Text("$rating Star${rating > 1 ? "s" : ""}"),
                            ))
                        .toList(),
                    onChanged: (newRating) {
                      setState(() {
                        _selectedRating = newRating!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Enter your comment",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addReview,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("Submit Review"),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text("BUY"),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildProductDetailItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  review["name"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  review["date"],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < review["rating"] ? Colors.orange : Colors.grey,
                  size: 16,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              review["comment"],
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
