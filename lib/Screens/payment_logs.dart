import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/single_selected_order.dart';

class Order {
  final String id;
  final String method;
  final String price;
  final status;

  Order({required this.id, required this.method, required this.price, required this.status});
}

class PaymentLogsScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: '001',
      method: 'Control Number',
      price: "25,000/=",
      status: 'Pending',
    ),
    Order(
      id: '002',
      method: 'Online Payment',
      price: "12,000/=",
      status: 'Success',
    ),
    Order(
      id: '003',
      method: 'Control Number',
      price: "45,000/=",
      status: 'Pending',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments Logs'),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Payment Details'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Order ID: ${order.id}'),
                          SizedBox(height: 8),
                          Text('Method: ${order.method}'),
                          SizedBox(height: 8),
                          Text('Price: ${order.price}'),
                          SizedBox(height: 8),
                          Text('Status: ${order.status}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),

);
  }
}
