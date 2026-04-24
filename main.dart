import 'package:flutter/material.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserScreen(),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  final List<Map<String, dynamic>> users = const [

    {"name": "john doe", "email": "johndoe@example.com", "bookings": 12, "active": true},
    {"name": "sarah smith", "email": "sarahsmith@example.com", "bookings": 8, "active": false},
    {"name": "mike johnson", "email": "mike@example.com", "bookings": 3, "active": true},
    {"name": "emily brown", "email": "emily@example.com", "bookings": 15, "active": false},
    {"name": "david wilson", "email": "david@example.com", "bookings": 5, "active": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "User Management",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  hintText: "Search users...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Row(
                children: [
                  filterButton("All", true),
                  filterButton("Active", false),
                  filterButton("Blocked", false),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink,
                          child: Text(
                            user["name"][0].toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                        title: Text(user["name"]),

                        subtitle: Text(
                          "${user["email"]}\n${user["bookings"]} bookings",
                        ),

                        isThreeLine: true,

                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.remove_red_eye_rounded,
                                color: Colors.blue),
                            const SizedBox(height: 5),
                            Icon(
                              user["active"]
                                  ? Icons.person_add
                                  : Icons.person_remove,
                              color: user["active"]
                                  ? Colors.green
                                  : Colors.pink,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Owners"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget filterButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}