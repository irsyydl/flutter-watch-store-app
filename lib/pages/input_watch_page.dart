import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:watch_store/providers/watch_list_providers.dart';
import 'package:watch_store/models/watch.dart';

class AddWatchPage extends StatelessWidget {
  const AddWatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    final nameController = TextEditingController();
    final brandController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();
    final imageUrlController = TextEditingController();

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Watch Page"),
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
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
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
                  labelText: "Brand Name",
                  labelStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
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
                  labelText: "Price",
                  labelStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
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
                  labelText: "Description",
                  labelStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
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
                  labelText: "Image path",
                  labelStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.grey,
                  ),
                ),
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
                onPressed: () {
                  // Step 4: Check if the form is valid
                  if (_formKey.currentState!.validate()) {
                    final newWatch = Watch(
                      name: nameController.text,
                      brandName: brandController.text,
                      price: priceController.text,
                      description: descriptionController.text,
                      imageUrl: imageUrlController.text,
                    );
                    final watchListProvider =
                        Provider.of<WatchListProvider>(context, listen: false);
                    watchListProvider.addWatch(newWatch);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Watch added successfully!'),
                      ),
                    );
                    Navigator.pop(context);
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
