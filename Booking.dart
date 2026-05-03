import 'package:flutter/material.dart';

void main() {
  runApp(const HallRentalApp());
}

class HallRentalApp extends StatelessWidget {
  const HallRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF5F5F7),
      ),
      home: const BookingsScreen(),
    );
  }
}

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
            decoration: const BoxDecoration(
              color: Color(0xff7B3FE4),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bookings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTab("All", isSelected: true),
                      _buildTab("Pending"),
                      _buildTab("Confirmed"),
                      _buildTab("Rejected"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCard(
                  initials: "SJ",
                  name: "Sarah Johnson",
                  email: "sarah.j@email.com",
                  status: "pending",
                  hall: "Grand Ballroom",
                  date: "Apr 15, 2026",
                  guests: "280 guests",
                  price: "\$ 1200",
                  showButtons: true,
                ),
                const SizedBox(height: 15),
                _buildCard(
                  initials: "MC",
                  name: "Michael Chen",
                  email: "michael.c@email.com",
                  status: "confirmed",
                  hall: "Crystal Hall",
                  date: "Apr 18, 2026",
                  guests: "120 guests",
                  price: "\$ 800",
                  showButtons: false,
                ),


                _buildCard(
                  initials: "SJ",
                  name: "Sarah Johnson",
                  email: "sarah.j@email.com",
                  status: "pending",
                  hall: "Grand Ballroom",
                  date: "Apr 15, 2026",
                  guests: "280 guests",
                  price: "\$ 1200",
                  showButtons: true,
                ),
                const SizedBox(height: 15),
                _buildCard(
                  initials: "MC",
                  name: "Michael Chen",
                  email: "michael.c@email.com",
                  status: "confirmed",
                  hall: "Crystal Hall",
                  date: "Apr 18, 2026",
                  guests: "120 guests",
                  price: "\$ 800",
                  showButtons: false,
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xff9B5CF6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xff7B3FE4) : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildCard({
    required String initials,
    required String name,
    required String email,
    required String status,
    required String hall,
    required String date,
    required String guests,
    required String price,
    required bool showButtons,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffF0E9FF),
                child: Text(initials, style: const TextStyle(color: Color(0xff7B3FE4))),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(email, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const Spacer(),
              _statusPill(status),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffF5F1FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hall, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.people_alt, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(guests, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const Spacer(),
                    Text(price, style: const TextStyle(color: Color(0xff7B3FE4), fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          if (showButtons) ...[
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _btn("Accept", const Color(0xff00C853), Icons.check)),
                const SizedBox(width: 10),
                Expanded(child: _btn("Reject", const Color(0xffFF3B30), Icons.close)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _statusPill(String status) {
    bool isPending = status == "pending";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPending ? const Color(0xffFFFCE0) : const Color(0xffE8F5E9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isPending ? Colors.orange : Colors.green,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _btn(String label, Color col, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: col,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}