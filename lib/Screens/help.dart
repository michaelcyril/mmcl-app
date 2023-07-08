import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Utils/menu_cards.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          CardWidget(
            title: 'Company Name',
            description: 'MMCL',
            icon: Icon(
              Icons.factory,
              color: AppColors.appColor,
              size: 15,
            ),
          ),
          CardWidget(
            title: 'Email',
            description: 'info@mmcl.co.tz',
            icon: Icon(
              Icons.email,
              color: AppColors.appColor,
              size: 15,
            ),
          ),
          CardWidget(
            title: 'Phone',
            description: '+255774350001',
            icon: Icon(
              Icons.phone,
              color: AppColors.appColor,
              size: 15,
            ),
          ),
          SizedBox(height: 10),
          // Add more CardWidgets as needed
        ],
      ),
     );
  }
}