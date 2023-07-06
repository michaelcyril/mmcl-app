import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';

class SingleSelectedOrderScreen extends StatefulWidget {
  const SingleSelectedOrderScreen({super.key});

  @override
  State<SingleSelectedOrderScreen> createState() =>
      _SingleSelectedOrderScreenState();
}

class _SingleSelectedOrderScreenState extends State<SingleSelectedOrderScreen> {
  final List<OrderItem> orderItems = [
    OrderItem(
      id: '001',
      contents: 'product1',
      price: 29.99,
      status: 'Processing',
    ),
    OrderItem(
      id: '002',
      contents: 'Product 3',
      price: 12.99,
      status: 'Delivered',
    ),
    OrderItem(
      id: '003',
      contents: 'Product 4',
      price: 45.99,
      status: 'Shipped',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Set the desired height
        child: AppBar(
          flexibleSpace: Container(
            height: 200.0, // Set the desired height
            decoration: BoxDecoration(
              // color: Colors.amber
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/container3.jpg'), // Replace with your own image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Other AppBar properties (e.g., title, actions, etc.)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Order 001',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Product ID: 01'),
                    subtitle: Text('Price: \$12.0'),
                    trailing: Text('Quantity: 2'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Product ID: 02'),
                    subtitle: Text('Price: \$12.0'),
                    trailing: Text('Quantity: 2'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Product ID: 03'),
                    subtitle: Text('Price: \$12.0'),
                    trailing: Text('Quantity: 2'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Product ID: 04'),
                    subtitle: Text('Price: \$12.0'),
                    trailing: Text('Quantity: 2'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Product ID: 05'),
                    subtitle: Text('Price: \$12.0'),
                    trailing: Text('Quantity: 2'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Card(
                        color: AppColors.cardColor,
        elevation: 2,
        child: ListTile(
          title: Text('No of products: 9'),
          subtitle: Text("Amont paid : \$30.00"),
          // trailing: Text('Quantity: 2'),
        ),
      ),
    );
  }
}

class OrderItem {
  final String id;
  final String contents;
  final double price;
  final String status;

  OrderItem(
      {required this.id,
      required this.contents,
      required this.price,
      required this.status});
}
