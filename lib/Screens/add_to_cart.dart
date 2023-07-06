import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:order_carg_app/Constants/colors.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController lectureController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  String? selectedCategoryId;
  String? selectedCargoTypeId;
  PlatformFile? selectedFile;

  final _formKey = GlobalKey<FormState>();

  Future<List<Category>> fetchCategory(context) async {
    // var res = await CallApi().authenticatedGetRequest('baseline-activity');
    var res = 2;
    if (res != null) {
      // var body = json.decode(res.body);

      // var categoryJson = json.decode(res.body);

      List<Category> categoryItemsList = [
        Category('1', 'Container'),
        Category('2', 'Car')
      ];

      // for (var f in categoryJson) {
      //   Category categoryItems = Category(
      //     f["id"].toString(),
      //     f["name"].toString(),
      //   );
      //   categoryItemsList.add(categoryItems);
      // }

      return categoryItemsList;
    } else {
      return [];
    }
  }

  Future<List<CargoType>> fetchCargoType(context) async {
    // var res = await CallApi().authenticatedGetRequest('baseline-activity');
    var res = 2;
    if (res != null) {
      // var body = json.decode(res.body);

      // var cargoTypeJson = json.decode(res.body);

      List<CargoType> cargoTypeItemsList = [
        CargoType('1', 'CargoA'),
        CargoType('2', 'CargoB')
      ];

      // for (var f in cargoTypeJson) {
      //   CargoType cargoTypeItems = CargoType(
      //     f["id"].toString(),
      //     f["name"].toString(),
      //   );
      //   cargoTypeItemsList.add(cargoTypeItems);
      // }

      return cargoTypeItemsList;
    } else {
      return [];
    }
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      // Access the picked file's properties
      String fileName = file.name;
      String filePath = file.path!;
      int fileSize = file.size;
      String mimeType = file.extension!;
      setState(() {
        selectedFile = file;
      });

      // Perform actions with the picked file
      // e.g., upload it to a server, process it, etc.
    } else {
      // User canceled the file picking operation
    }
  }

  void onClickAdd() {
    if (_formKey.currentState!.validate()) {
      if (selectedFile == null ||
          selectedCargoTypeId == null ||
          selectedCategoryId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.black,
            content: Text('Fill all the inputs.'),
            duration: Duration(seconds: 3), // Optional duration
          ),
        );
      } else {
        print("now submit --------------------------");
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 0),
            Text('Add Order'),
            SizedBox(width: 32),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: venueController,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              labelText: 'Price to pay'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            child: FutureBuilder<List<CargoType>>(
                          future: fetchCargoType(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data!;
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropdownButton<String>(
                                  hint: const Text('Select Cargo Type'),
                                  dropdownColor: Colors.white,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 36,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  value: selectedCargoTypeId,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCargoTypeId = newValue!;
                                    });
                                  },
                                  items: data.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem.id,
                                      child: Text(valueItem.name.toString()),
                                    );
                                  }).toList(),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            child: FutureBuilder<List<Category>>(
                          future: fetchCategory(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data!;
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: DropdownButton<String>(
                                  hint: const Text('Select Category'),
                                  dropdownColor: Colors.white,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 36,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  value: selectedCategoryId,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCategoryId = newValue!;
                                    });
                                  },
                                  items: data.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem.id,
                                      child: Text(valueItem.name.toString()),
                                    );
                                  }).toList(),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )),
                      ),
                      selectedFile != null
                          ? Card(
                              color: AppColors.cardColor,
                              elevation: 2,
                              child: ListTile(
                                title: Text('Selected document'),
                                subtitle: Text(
                                    "Document name : ${selectedFile!.name}"),
                              ),
                            )
                          : const Card(
                              color: AppColors.cardColor,
                              elevation: 2,
                              child: ListTile(
                                title: Text('Selected document'),
                                subtitle: Text("No document selected"),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                  pickFile();
                                },
                                child: const Text(
                                  'Pick File',
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
                                  onClickAdd();
                                },
                                child: const Text(
                                  'Add',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CargoType {
  final String? id, name;

  CargoType(this.id, this.name);
}

class Category {
  final String? id, name;

  Category(this.id, this.name);
}
