import 'package:flutter/material.dart';
import 'package:project/owner/Add_Hell.dart';
import 'package:project/owner/Halls.dart';
import 'package:project/owner/Profile_owner.dart';
import 'package:project/owner/Booking.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    const HomeContent(),
    Halls(),
    HallRentalApp(),
    MyApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF7C3AED),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Halls"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key}); // تم تصحيح الخطأ هنا من super.body لـ super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
            decoration: const BoxDecoration(
              color: Color(0xFF7C3AED),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                Text("Here's your business overview",
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Row(
                children: [
                  _stat(Icons.business, "Total Halls", "12", Colors.purple),
                  const SizedBox(width: 10),
                  _stat(Icons.calendar_today, "Bookings", "34", Colors.blue),
                  const SizedBox(width: 10),
                  _stat(Icons.attach_money, "Revenue", "\$24.5k", Colors.green),
                ],
              ),
            ),
          ),
          _title("Quick Actions"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // تفعيل الانتقال لصفحة الإضافة
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add_hells()),
                      );
                    },
                    child: _action("Add Hall", Icons.add, filled: true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _action("View\nBookings", Icons.calendar_today,
                      filled: false),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Bookings",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See all")),
              ],
            ),
          ),
          _booking("SJ", "Sarah Johnson", "Grand Ballroom", "Apr 15, 2026",
              "pending"),
          _booking("MC", "Michael Chen", "Crystal Hall", "Apr 18, 2026",
              "confirmed"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _title(String t) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
    child: Text(t,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
  );

  static Widget _stat(IconData icon, String label, String value, Color c) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: c),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(value,
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  static Widget _action(String label, IconData icon, {required bool filled}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: filled ? const Color(0xFF7C3AED) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: filled ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: filled
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600))
        ],
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF7C3AED)),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600))
        ],
      ),
    );
  }

  static Widget _booking(
      String initials, String name, String hall, String date, String status) {
    final confirmed = status == "confirmed";
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: const Color(0xFFF3F0FF),
              child: Text(initials,
                  style: const TextStyle(
                      color: Color(0xFF7C3AED), fontWeight: FontWeight.bold))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(hall, style: const TextStyle(color: Colors.grey)),
                ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                  color: confirmed ? Colors.green[50] : Colors.orange[50],
                  borderRadius: BorderRadius.circular(8)),
              child: Text(status,
                  style: TextStyle(
                      color: confirmed ? Colors.green : Colors.orange,
                      fontSize: 12)),
            ),
          ]),
        ]),
      ),
    );
  }
}