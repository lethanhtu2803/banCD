import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final List<Map<String, dynamic>> _cartItems = [
    {"name": "Product 1", "price": 15.99, "quantity": 1, "imageUrl": "https://via.placeholder.com/150"},
    {"name": "Product 2", "price": 25.99, "quantity": 2, "imageUrl": "https://via.placeholder.com/150"},
    {"name": "Product 3", "price": 35.99, "quantity": 1, "imageUrl": "https://via.placeholder.com/150"},
    {"name": "Product 3", "price": 35.99, "quantity": 1, "imageUrl": "https://via.placeholder.com/150"},
    {"name": "Product 3", "price": 35.99, "quantity": 1, "imageUrl": "https://via.placeholder.com/150"},
  ];

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return CartItem(
                  name: item["name"],
                  price: item["price"],
                  quantity: item["quantity"],
                  imageUrl: item["imageUrl"],
                  onRemove: () {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      _cartItems[index]["quantity"] = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          CheckoutSection(totalPrice: totalPrice),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;

  const CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text("\$${price.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.teal, fontSize: 14)),
                    SizedBox(height: 5),
                    Row(
                      children: [

                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            if (quantity > 1) {
                              onQuantityChanged(quantity - 1);
                            }
                          },
                        ),
                        Text("$quantity", style: TextStyle(fontSize: 16)),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            onQuantityChanged(quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  final double totalPrice;

  const CheckoutSection({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Checkout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
