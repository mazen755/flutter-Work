import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {

  int selectedIndex = 0;

  List<String> filters = ["All", "Confirmed", "Pending"];

  List bookings = [
    {
      "title": "Crystal Ballroom",
      "id": "Booking #1",
      "user": "John Doe",
      "date": "2026-05-15",
      "price": "\$5000",
      "status": "confirmed"
    },
    {
      "title": "Garden Paradise",
      "id": "Booking #2",
      "user": "Sarah Smith",
      "date": "2026-05-20",
      "price": "\$3500",
      "status": "pending"
    },
    {
      "title": "Skyline Suite",
      "id": "Booking #3",
      "user": "Mike Lee",
      "date": "2026-05-25",
      "price": "\$4200",
      "status": "confirmed"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        items:  [
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

            /// 🔹 Title
            const Text(
              "Bookings",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Manage all hall bookings",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// 🔹 Filters
            Row(
              children: List.generate(filters.length, (index) {
                bool isSelected = selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list,
                              size: 18,
                              color: isSelected ? Colors.white : Colors.black),
                          const SizedBox(width: 5),
                          Text(
                            filters[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            /// 🔹 Bookings List
            ...bookings.map((b) {
              return bookingCard(b);
            }).toList(),

          ],
        ),
      ),
    );
  }

  /// 🔹 Booking Card
  Widget bookingCard(Map booking) {

    Color statusColor =
    booking["status"] == "confirmed" ? Colors.green : Colors.orange;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Title + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking["title"],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    booking["status"],
                    style: TextStyle(color: statusColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Text(booking["id"], style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),

            /// User + Date
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.grey),
                const SizedBox(width: 5),
                Text(booking["user"]),

                const SizedBox(width: 20),

                const Icon(Icons.calendar_today,
                    size: 18, color: Colors.grey),
                const SizedBox(width: 5),
                Text(booking["date"]),
              ],
            ),

            const SizedBox(height: 10),

            /// Price
            Row(
              children: [
                const Icon(Icons.attach_money, color: Colors.green),
                const SizedBox(width: 5),
                Text(
                  booking["price"],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}