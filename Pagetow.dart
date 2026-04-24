import 'package:flutter/material.dart';

class Pagetow extends StatefulWidget {
  const Pagetow({super.key});

  @override
  State<Pagetow> createState() => _PagetowState();
}

class _PagetowState extends State<Pagetow> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "all",
    "confirmed",
    "pending",
    "cancelled",
  ];

  final List<Map<String, String>> bookings = [
    {
      "title": "Crystal Ballroom",
      "status": "confirmed",
      "price": "\$5000",
      "name": "John Doe",
      "date": "2026-05-15",
    },
    {
      "title": "Garden Paradise",
      "status": "pending",
      "price": "\$3500",
      "name": "Sarah Smith",
      "date": "2026-05-20",
    },
    {
      "title": "Skyline Suite",
      "status": "confirmed",
      "price": "\$7000",
      "name": "Emily Brown",
      "date": "2026-06-10",
    },
    {
      "title": "Royal Hall",
      "status": "cancelled",
      "price": "\$4000",
      "name": "Michael Lee",
      "date": "2026-06-12",
    },
    {
      "title": "Ocean View",
      "status": "confirmed",
      "price": "\$6500",
      "name": "David Kim",
      "date": "2026-07-01",
    },
    {
      "title": "Golden Hall",
      "status": "pending",
      "price": "\$5200",
      "name": "Anna White",
      "date": "2026-07-05",
    },
  ];

  List<Map<String, String>> get filteredBookings {
    if (selectedIndex == 0) return bookings;

    return bookings.where((b) {
      return b["status"]!.toLowerCase() ==
          tabs[selectedIndex].toLowerCase();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bookings",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Manage all hall bookings",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: TabItem(
                      title: tabs[index],
                      selected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: filteredBookings.length,
                itemBuilder: (context, index) {
                  final item = filteredBookings[index];

                  return BookingCard(
                    title: item["title"] ?? "",
                    status: item["status"] ?? "",
                    price: item["price"] ?? "",
                    name: item["name"] ?? "",
                    date: item["date"] ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const TabItem({
    super.key,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String title;
  final String status;
  final String price;
  final String name;
  final String date;

  const BookingCard({
    super.key,
    required this.title,
    required this.status,
    required this.price,
    required this.name,
    required this.date,
  });

  Color getColor() {
    if (status == "confirmed") return Colors.green;
    if (status == "pending") return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: getColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: getColor()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("👤 $name"),
              Text("📅 $date"),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "💲 $price",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}