import 'package:flutter/material.dart';

class ComplaintsScreen extends StatelessWidget {
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
            Text("Complaints", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Handle user complaints and issues"),
            SizedBox(height: 20),
            complaintCard("Poor service quality", "Mike Johnson", "open", Colors.orange),
            complaintCard("Billing issue", "Sarah Smith", "resolved", Colors.green),
            complaintCard("Facility not as described", "Emily Brown", "open", Colors.orange),

            complaintCard("Poor service quality", "Mike Johnson", "open", Colors.orange),
            complaintCard("Billing issue", "Sarah Smith", "resolved", Colors.green),
            complaintCard("Facility not as described", "Emily Brown", "open", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget complaintCard(String title, String user, String status, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.error_outline, color: color),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("by $user"),
        trailing: Chip(
          label: Text(status),
          backgroundColor: color.withOpacity(0.2),
        ),
      ),
    );
  }
}