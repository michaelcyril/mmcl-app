import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/single_selected_order.dart';

class Order {
  final String id;
  final List<String> contents;
  final String price;
  final String status;

  Order({required this.id, required this.contents, required this.price, required this.status});
}

class OrdersScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: '001',
      contents: ['Product 1', 'Product 2'],
      price: "35,000/=",
      status: 'Pending',
    ),
    Order(
      id: '002',
      contents: ['Product 3'],
      price: "45,000/=",
      status: 'Approved',
    ),
    Order(
      id: '003',
      contents: ['Product 4', 'Product 5', 'Product 6'],
      price: "15,000/=",
      status: 'Rejected',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = orders[index];
          return Card(
                        color: AppColors.cardColor,
            child: ListTile(
              title: Text('Order ID: ${order.id}'),
              subtitle: Text('Status: ${order.status}'),
              trailing: Text('${order.price}'),
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Order Details'),
                //       content: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Text('Order ID: ${order.id}'),
                //           SizedBox(height: 8),
                //           Text('Contents: ${order.contents.join(', ')}'),
                //           SizedBox(height: 8),
                //           Text('Price: \$${order.price.toStringAsFixed(2)}'),
                //           SizedBox(height: 8),
                //           Text('Status: ${order.status}'),
                //         ],
                //       ),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: Text('Close'),
                //         ),
                //       ],
                //     );
                //   },
                // );
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SingleSelectedOrderScreen()),
                    );
              },
            ),
          );
        },
      ),

);
  }
}
