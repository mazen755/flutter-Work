import 'package:flutter/material.dart';

class HallApprovalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: "Owners"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Hall Approval", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("3 halls pending approval"),
            SizedBox(height: 20),
            hallCard(),
            hallCard(),
            hallCard(),
            hallCard(),
            hallCard(),
          ],
        ),
      ),
    );
  }

  Widget hallCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            child: Center(
              child: Icon(Icons.image, size: 50, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Crystal Ballroom", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("by Luxe Spaces"),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.people, size: 16),
                    Text(" 300   "),
                    Icon(Icons.location_on, size: 16),
                    Text(" Downtown   "),
                    Icon(Icons.attach_money, size: 16),
                    Text(" 5000"),
                  ],
                ),
                SizedBox(height: 5),
                Text("Submitted 2026-04-15"),
              ],
            ),
          )
        ],
      ),
    );
  }
}