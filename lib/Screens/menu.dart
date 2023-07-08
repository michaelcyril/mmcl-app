import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';
import 'package:order_carg_app/Screens/help.dart';
import 'package:order_carg_app/Screens/home.dart';
import 'package:order_carg_app/Screens/my_orders.dart';
import 'package:order_carg_app/Screens/place_order.dart';
import 'package:order_carg_app/Screens/profile.dart';
import 'package:order_carg_app/Utils/menu_cards.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    HomeScreen(),
    ProfileScreen(),
    HelpScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 0),
            SizedBox(width: 0),
            // SizedBox(width: 32),
            Text('Mmcl App'),
            SizedBox(width: 0),
            SizedBox(width: 0),
            Image.asset(
              'assets/images/logo.png', // Replace with your own logo image path
              height: 32,
            ),
          ],
        ),
      ),

      drawer: Drawer(
        backgroundColor: AppColors.appColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
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
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Home'),
            //   onTap: () {
            //     // Handle drawer item tap for home
            //   },
            // ),
            Card(
              // color: AppColors.cardColor,
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  areYouSureYoWantToLogOut(context);
                  // Handle drawer item tap for settings
                },
              ),
            ),
          ],
        ),
      ),

      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(150.0), // Set the desired height
      //   child: AppBar(
      //     automaticallyImplyLeading: false,
      //     backgroundColor: Colors.white,
      // flexibleSpace: Container(
      //   height: 200,
      //   // color: Colors.blue,
      //   child: Center(
      //     child: CircleAvatar(
      //       radius: 50,
      //       backgroundImage: AssetImage('assets/images/profile.png'),
      //     ),
      //   ),
      // ),
      //   ),
      // ),
      
     body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
