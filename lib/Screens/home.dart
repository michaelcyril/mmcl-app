import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/claim_screen.dart';
import 'package:order_carg_app/Screens/my_orders.dart';
import 'package:order_carg_app/Screens/payment_logs.dart';
import 'package:order_carg_app/Screens/place_order.dart';
import 'package:order_carg_app/Utils/menu_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Set the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            height: 200,
            // color: Colors.blue,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),

          SizedBox(height: 10),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle click on the first card
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrdersScreen()),
                      );
                    },
                    child: Card(
                      color: AppColors.cardColor,
                      elevation: 2,
                      child: Container(
                        height: 150, // Set your desired height here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/order.png'),
                            ),
                            Center(
                              child: Text('View Books'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 10), // Add spacing between the cards
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle click on the second card
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    child: Card(
                      color: AppColors.cardColor,
                      elevation: 2,
                      child: Container(
                        height: 150, // Set your desired height here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/add-product.png'),
                            ),
                            Center(
                              child: Text('+ Book'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle click on the first card
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentLogsScreen()),
                      );
                    },
                    child: Card(
                      color: AppColors.cardColor,
                      elevation: 2,
                      child: Container(
                        height: 150, // Set your desired height here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/payment-system.png'),
                            ),
                            Center(
                              child: Text('Payments'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 10), // Add spacing between the cards
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle click on the second card
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClaimScreen()),
                      );
                    },
                    child: Card(
                      color: AppColors.cardColor,
                      elevation: 2,
                      child: Container(
                        height: 150, // Set your desired height here
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/refund.png'),
                            ),
                            Center(
                              child: Text('Claims'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add more CardWidgets as needed
        ],
      ),
    );
  }
}
