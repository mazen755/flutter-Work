import 'package:flutter/material.dart';
import 'reports_screen.dart';
import 'complaints_screen.dart';
import 'hall_approval_screen.dart';
import 'bookings_screen.dart';
import 'package:project/admin/user.dart';
import 'package:project/admin/owner_admin.dart';
import 'package:project/admin/more_Admin/more.dart';
import 'package:project/admin/Setting.dart';
void main() {
  runApp(Adminhome());
}

class Adminhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dashboard Overview",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("Welcome back!",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      )
          : null,
      body: _selectedIndex == 0
          ? Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  dashboardCard(Icons.person, Colors.blue, "1,284", "Users"),
                  dashboardCard(Icons.business, Colors.purple, "156", "Owners"),
                  dashboardCard(Icons.calendar_month, Colors.teal, "2,547", "Bookings"),
                  dashboardCard(Icons.access_time, Colors.orange, "18", "Pending"),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Quick Actions",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  actionCard(
                    Icons.check,
                    Colors.green,
                    "Approve",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HallApprovalScreen(),
                        ),
                      );
                    },
                  ),
                  actionCard(
                    Icons.error,
                    Colors.red,
                    "Complaints",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComplaintsScreen(),
                        ),
                      );
                    },
                  ),
                  actionCard(
                    Icons.show_chart,
                    Colors.blue,
                    "Analytics",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pagefive(),
                        ),
                      );
                    },
                  ),
                  actionCard(
                    Icons.book,
                    Colors.purple,
                    "Bookings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Recent Activity",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              activityTile("New hall registered", "5 min ago", Colors.blue),
              activityTile("Complaint resolved", "15 min ago", Colors.green),
              activityTile("User blocked", "1 hour ago", Colors.orange),
            ],
          ),
        ),
      )
          : _selectedIndex == 1
          ? Scaffold(body: UserPage())
          : _selectedIndex == 2
          ? Scaffold(body: HallOwnersApp())
          : _selectedIndex == 3
          ? Scaffold(body: MYscreen())
          : Scaffold(body: AdminSettingsScreen()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "users",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "owners",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: "more",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(icon, color, number, label) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          Spacer(),
          Text(number,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget actionCard(icon, color, label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget activityTile(title, time, color) {
    return ListTile(
      leading: CircleAvatar(radius: 5, backgroundColor: color),
      title: Text(title),
      subtitle: Text(time),
    );
  }
}