import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff6A11CB), Color(0xffA855F7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, size: 45, color: Colors.white),
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Hall Owner",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -70,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 12),
                      ],
                    ),

                    child: Column(
                      children: [
                        SizedBox(height: 0),
                        buildInfo(Icons.email, "Email", "john.doe@email.com"),
                        SizedBox(height: 0),
                        buildInfo(Icons.phone, "Phone", "+1 (555) 123-4567"),
                        SizedBox(height: 0),
                        buildInfo(Icons.location_on, "Location", "New York, NY"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple.withOpacity(0.1),
                          child: Icon(Icons.business, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Business Stats",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("12 Halls • 34 Bookings",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildStat("4.8", "Rating"),
                        buildStat("156", "Reviews"),
                        buildStat("\$24.5k", "Revenue"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            buildMenu(Icons.person, "Edit Profile"),
            buildMenu(Icons.notifications, "Notifications"),
            buildMenu(Icons.lock, "Privacy & Security"),
            buildMenu(Icons.help_outline, "Help & Support"),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(IconData icon, String title, String value) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.withOpacity(0.1),
          child: Icon(icon, color: Colors.purple),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey)),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget buildStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget buildMenu(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple.withOpacity(0.1),
              child: Icon(icon, color: Colors.purple),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}