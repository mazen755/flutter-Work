import 'package:flutter/material.dart';
import 'card.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

         bottomNavigationBar: BottomNavigationBar(
             items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]),
        appBar: AppBar(
          toolbarHeight: 180,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find Your Dream Venue",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Perfect spaces for perfect moments",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for wedding halls",
                  hintStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text(
              "Categories:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildCategory(Icons.star, "Star", Colors.yellow),
                SizedBox(width: 6),
                buildCategory(Icons.label_important, "Sahm", Colors.green),
                SizedBox(width: 6),
                buildCategory(Icons.location_off, "Location", Colors.blue),
                SizedBox(width: 6),
                buildCategory(Icons.location_history_outlined, "Indoor", null,
                    gradient: LinearGradient(
                        colors: [Colors.pink, Colors.purple])),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Halls",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            thisone(context),
            thistow(),
            thisthree(),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(IconData icon, String label, Color? color,
      {Gradient? gradient}) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget thistow() {
    return SizedBox();
  }

  Widget thisthree() {
    return SizedBox();
  }
}

Widget thisone(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => card()),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text("4.9"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Crystal Ballroom",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "Downtown, Manhattan",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$5,000 /night",
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "234 reviews",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}