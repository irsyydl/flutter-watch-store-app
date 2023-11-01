import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/watch.dart';

class AddWatchPage extends StatefulWidget {
  const AddWatchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddWatchPageState createState() => _AddWatchPageState();
}

class _AddWatchPageState extends State<AddWatchPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController brandController = TextEditingController();
  late final TextEditingController priceController = TextEditingController();
  late final TextEditingController descriptionController =
      TextEditingController();
  late final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Watch Page",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: brandController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    labelText: "Brand Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a brand name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    labelText: "Price"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a price";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    labelText: "Description"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    labelText: "Image path"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the image path";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              CupertinoButton(
                color: Colors.blue[200],
                // Replace ElevatedButton with CupertinoButton
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newWatch = Watch(
                      name: nameController.text,
                      brandName: brandController.text,
                      price: priceController.text,
                      description: descriptionController.text,
                      imageUrl: imageUrlController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Watch added successfully!'),
                      ),
                    );
                    Navigator.pop(context, newWatch);
                  }
                },
                child: const Text("Add Watch"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
