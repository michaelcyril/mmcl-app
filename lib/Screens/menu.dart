import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/my_orders.dart';
import 'package:order_carg_app/Screens/place_order.dart';
import 'package:order_carg_app/Utils/menu_cards.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  areYouSureYoWantToLogOut(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Attempt'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to logout.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     backgroundColor:  Colors.black,
                //     content: Text('The payment will be done in cash.', style: TextStyle(color: Colors.white),),
                //     duration: Duration(seconds: 3), // Optional duration
                //   ),
                // );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Image.asset(
      //         'assets/images/logo.png', // Replace with your own logo image path
      //         height: 32,
      //       ),
      //       // SizedBox(width: 8),
      //       Text('MMCL'),
      //       SizedBox(width: 32),
      //     ],
      //   ),
      // ),

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
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Container(
          //   height: 200,
          //   // color: Colors.blue,
          //   child: Center(
          //     child: CircleAvatar(
          //       radius: 50,
          //       backgroundImage: AssetImage('assets/images/profile.png'),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          CardWidget(
            title: 'Username',
            description: 'Michael Cyril',
            icon: Icon(
              Icons.person,
              color: AppColors.appColor,
              size: 15,
            ),
          ),
          CardWidget(
            title: 'Email',
            description: 'michaelcyril71@gmail.com',
            icon: Icon(
              Icons.email,
              color: AppColors.appColor,
              size: 15,
            ),
          ),
          CardWidget(
            title: 'Phone',
            description: '+255693331836',
            icon: Icon(
              Icons.phone,
              color: AppColors.appColor,
              size: 15,
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
                        MaterialPageRoute(builder: (context) => OrdersScreen()),
                      );
                    },
                    child: Card(
                      color: AppColors.cardColor,
                      elevation: 2,
                      child: Container(
                        height: 100, // Set your desired height here
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
                              child: Text('My orders'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between the cards
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
                        height: 100, // Set your desired height here
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
                              child: Text('New orders'),
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
          SizedBox(height: 10),

          SizedBox(height: 10),
          // Add more CardWidgets as needed
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.appColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius
              ),
            ),
            onPressed: () {
              // Add your button press logic here
              // Navigator.pop(context);
              areYouSureYoWantToLogOut(context);
            },
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
