import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/add_to_cart.dart';
import 'package:order_carg_app/Screens/online_payment.dart';

class Order {
  final String productName;
  final String price;

  Order({required this.productName, required this.price});
}

class CartScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(productName: 'Product 1', price: "10,000/="),
    Order(productName: 'Product 2', price: "10,000/="),
    Order(productName: 'Product 3', price: "5,000/="),
  ];

  selectPaymentMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Method'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Choose the payment method"),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      elevation: 0,
                      color: AppColors.appColor,
                      height: 50,
                      // minWidth: 500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => AddOrder()),
                        // );
                        Navigator.pop(context);
                        selectedCashDialog(context);
                      },
                      child: const Text(
                        'CONTROL NUMBER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MaterialButton(
                      elevation: 0,
                      color: AppColors.appColor,
                      height: 50,
                      // minWidth: 500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnlinePaymentScreen()),
                        );
                      },
                      child: const Text(
                        'ONLINE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text('Close'),
          //   ),
          // ],
        );
      },
    );
  }

  selectedCashDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Control Number Payment Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order ID: 001'),
              SizedBox(height: 8),
              // Text('Contents: ${order.contents.join(', ')}'),
              // SizedBox(height: 8),
              Text('Price: 25,000/='),
              SizedBox(height: 8),
              // Text('Contents: ${order.contents.join(', ')}'),
              // SizedBox(height: 8),
              Text('Control Number: 99900282828'),
              SizedBox(height: 8),
              Text(
                  'Here you need to confirm the payment will  be done via control number.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor:  Colors.black,
                    content: Text('The payment will be done using control number.', style: TextStyle(color: Colors.white),),
                    duration: Duration(seconds: 3), // Optional duration
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = orders[index];
          return Card(
                        color: AppColors.cardColor,
            elevation: 2,
            child: ListTile(
              title: Text(order.productName),
              subtitle: Text('${order.price}'),
              trailing: Text('Quantity: 1'),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                elevation: 0,
                color: AppColors.appColor,
                height: 50,
                // minWidth: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddOrder()),
                  );
                  // pickFile();
                },
                child: const Text(
                  'Add to Booking',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 32,
            ),
            Expanded(
              child: MaterialButton(
                elevation: 0,
                color: AppColors.appColor,
                height: 50,
                // minWidth: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.pop(context);
                  // }
                  selectPaymentMethod(context);
                },
                child: const Text(
                  'Total: 25,000/= \n Submit Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      
    );
    
  }
}
