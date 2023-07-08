import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void onClickAdd() {
    if (_formKey.currentState!.validate()) {
      // if (selectedFile == null ||
      //     selectedCargoTypeId == null ||
      //     selectedCategoryId == null) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     backgroundColor: Colors.blue,
        //     content: Text('Fill all the inputs.'),
        //     duration: Duration(seconds: 3), // Optional duration
        //   ),
        // );
      // } else {
      //   print("now submit --------------------------");
      //   Navigator.pop(context);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 0),
              Text('Online Payment'),
              SizedBox(width: 32),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nameController,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelText: 'Name on card'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: cardController,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelText: 'Card Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: codeController,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelText: 'Payment Code'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter payment code';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Card(
                    color: AppColors.cardColor,
                    elevation: 2,
                    child: ListTile(
                      title: Text('Amount to be paid'),
                      subtitle: Text("25,000/="),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Expanded(
                      child: MaterialButton(
                        elevation: 0,
                        color: AppColors.appColor,
                        height: 50,
                        minWidth: 500,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          // pickFile();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text('The online payment is successful.'),
                              duration: Duration(seconds: 3), // Optional duration
                            ),
                          );
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

    // body: Form(
    //   key: _formKey,
    //   child: SingleChildScrollView(
    //     child: Container(
    //       padding: const EdgeInsets.all(16),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 10, bottom: 10),
    //                   child: TextFormField(
    //                     keyboardType: TextInputType.number,
    //                     controller: nameController,
    //                     style: const TextStyle(fontSize: 15),
    //                     decoration: const InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(12)),
    //                         ),
    //                         labelText: 'Name on card'),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Please enter name';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 10, bottom: 10),
    //                   child: TextFormField(
    //                     keyboardType: TextInputType.number,
    //                     controller: cardController,
    //                     style: const TextStyle(fontSize: 15),
    //                     decoration: const InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(12)),
    //                         ),
    //                         labelText: 'Card Number'),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Please enter card number';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 10, bottom: 10),
    //                   child: TextFormField(
    //                     keyboardType: TextInputType.number,
    //                     controller: codeController,
    //                     style: const TextStyle(fontSize: 15),
    //                     decoration: const InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(12)),
    //                         ),
    //                         labelText: 'Payment Code'),
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Please enter payment code';
    //                       }
    //                       return null;
    //                     },
    //                   ),
    //                 ),
    //                 const Card(
    //                 color: AppColors.cardColor,
    //                   elevation: 2,
    //                   child: ListTile(
    //                     title: Text('Amount to be paid'),
    //                     subtitle: Text("23,000/="),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 10, bottom: 10),
    //                   child: Expanded(
    //                     child: MaterialButton(
    //                       elevation: 0,
    //                       color: AppColors.appColor,
    //                       height: 50,
    //                       minWidth: 500,
    //                       shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(12)),
    //                       onPressed: () {
    //                         // pickFile();
    //                         Navigator.pop(context);
    //                         Navigator.pop(context);
    //                         ScaffoldMessenger.of(context).showSnackBar(
    //                           SnackBar(
    //                             backgroundColor: Colors.black,
    //                             content: Text('The online payment is successful.'),
    //                             duration: Duration(
    //                                 seconds: 3), // Optional duration
    //                           ),
    //                         );
    //                       },
    //                       child: const Text(
    //                         'Pay',
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
  }
}
