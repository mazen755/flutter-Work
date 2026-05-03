import 'package:flutter/material.dart';
import 'package:project/owner/Add_Hell.dart';
import 'dart:io';

void main() {
  runApp(Halls());
}

/* ================= MODEL ================= */
class Hall {
  final String name;
  final File? image; // ✔ بدل String
  final int guests;
  final int price;
  final bool available;
  final String description; // ✔ جديد
  final String date; // ✔ جديد

  Hall({
    required this.name,
    required this.image,
    required this.guests,
    required this.price,
    required this.available,
    required this.description,
    required this.date,
  });
}

class Halls extends StatefulWidget {
  @override
  State<Halls> createState() => _HallsState();
}

class _HallsState extends State<Halls> {

  List<Hall> halls = [
    Hall(
      name: "Grand Ballroom",
      image: null, // ✔ مفيش صورة من الموبايل
      guests: 300,
      price: 1200,
      available: true,
      description: "",
      date: "",
    ),
    Hall(
      name: "Crystal Hall",
      image: null,
      guests: 150,
      price: 800,
      available: true,
      description: "",
      date: "",
    ),
  ];

  void addHall(Hall hall) {
    setState(() {
      halls.add(hall);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        /* ========== APP BAR ========== */
        appBar: AppBar(
          toolbarHeight: 180,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFc9184a), Color(0xFFa4133c)],
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Halls",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search halls...",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),

        /* ========== BODY ========== */
        body: ListView.builder(
          itemCount: halls.length,
          itemBuilder: (context, index) {
            final hall = halls[index];

            return Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 420,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEBEB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: hall.image != null
                              ? Image.file( // ✔ لو من الموبايل
                            hall.image!,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                              : Image.network( // ✔ لو افتراضي
                            "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: hall.available
                                  ? Colors.pink
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              hall.available ? "Available" : "Booked",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      hall.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person, color: Colors.grey),
                        Text("${hall.guests} Guests"),
                        const SizedBox(width: 20),
                        const Icon(Icons.monetization_on,
                            color: Colors.purple),
                        Text("\$${hall.price}/day"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        /* ========== BUTTON ========== */
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Add_hells()),
            );

            if (result != null) {
              addHall(result);
            }
          },
        ),
      ),
    );
  }
}