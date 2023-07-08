import 'package:flutter/material.dart';
import 'package:order_carg_app/Constants/colors.dart';

class ClaimScreen extends StatefulWidget {
  const ClaimScreen({super.key});

  @override
  State<ClaimScreen> createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  TextEditingController orderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedOption = 'Delayed Delivery';

  void _handleOptionChange(String? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  claimSubmitDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Claim Confirmation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order ID: ${orderController.text}'),
              SizedBox(height: 8),
              Text('Claim About: $_selectedOption'),
              // SizedBox(height: 8),
              // Text('Price: ${order.price}'),
              // SizedBox(height: 8),
              // Text('Status: ${order.status}'),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Decline'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Successful submission of claim.'),
                        duration: Duration(seconds: 3), // Optional duration
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
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
        title: Text('Claim Book'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: orderController,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelText: 'Order Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter order number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Claim About",
                    style: TextStyle(fontSize: 16),
                  ),
                  RadioListTile(
                      activeColor: AppColors.appColor,
                      hoverColor: AppColors.appColor,
                      title: Text('Delayed Delivery'),
                      value: 'Delayed Delivery',
                      groupValue: _selectedOption,
                      onChanged: _handleOptionChange),
                  RadioListTile(
                    activeColor: AppColors.appColor,
                    hoverColor: AppColors.appColor,
                    title: Text('Damaged Goods'),
                    value: 'Damaged Goods',
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    activeColor: AppColors.appColor,
                    hoverColor: AppColors.appColor,
                    title: Text('Incorrect Specifications'),
                    value: 'Incorrect Specifications',
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    activeColor: AppColors.appColor,
                    hoverColor: AppColors.appColor,
                    title: Text('Inadequate Customer Support'),
                    value: 'Inadequate Customer Support',
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    activeColor: AppColors.appColor,
                    hoverColor: AppColors.appColor,
                    title: Text('Regulatory Compliance'),
                    value: 'Regulatory Compliance',
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MaterialButton(
          // elevation: 0,
          color: AppColors.appColor,
          height: 50,
          minWidth: 500,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            // onClickAdd();
            if (_formKey.currentState!.validate()) {
              claimSubmitDialog();
            }
          },
          child: const Text(
            'Submit Claim',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
