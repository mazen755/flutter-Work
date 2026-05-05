import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Halls.dart';

class Add_hells extends StatefulWidget {
  @override
  State<Add_hells> createState() => _Add_hellsState();
}

class _Add_hellsState extends State<Add_hells> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  File? image;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Hall"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Hall Image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: image == null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.pink.shade100,
                      child: Icon(Icons.upload, color: Colors.pink),
                    ),
                    SizedBox(height: 10),
                    Text("Upload Hall Image"),
                    Text("JPG, PNG up to 10MB",
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(image!, fit: BoxFit.cover),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text("Hall Name",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "e.g., Grand Ballroom",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price per Day",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          prefixText: "\$ ",
                          hintText: "1200",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Capacity",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextField(
                        controller: _capacityController,
                        decoration: InputDecoration(
                          hintText: "300",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text("Description",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                "Describe your hall's features and amenities...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 20),

            Text("Available Dates",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select dates",
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (picked != null) {
                  setState(() {
                    _dateController.text =
                    "${picked.day}/${picked.month}/${picked.year}";
                  });
                }
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Hall newHall = Hall(
                    name: _nameController.text,
                    image: image,
                    guests: int.parse(_capacityController.text),
                    price: int.parse(_priceController.text),
                    description: _descController.text,
                    date: _dateController.text,
                    available: true,
                  );

                  Navigator.pop(context, newHall);
                },
                child: Text(
                  "Add Hall",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}