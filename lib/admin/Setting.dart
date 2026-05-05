import 'package:flutter/material.dart';
import 'package:project/user/login.dart';
class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [

          _sectionTitle("General"),

          _tile(Icons.person, "Profile"),
          _tile(Icons.notifications, "Notifications"),
          _tile(Icons.security, "Security"),

          const SizedBox(height: 10),

          _sectionTitle("Management"),

          _tile(Icons.people, "Users"),
          _tile(Icons.business, "Owners"),
          _tile(Icons.calendar_month, "Bookings"),

          const SizedBox(height: 10),

          _sectionTitle("System"),

          _tile(Icons.language, "Language"),
          _tile(Icons.dark_mode, "Dark Mode", trailing: Switch(value: false, onChanged: (v) {})),
          _tile(Icons.storage, "Storage"),

          const SizedBox(height: 10),

          _sectionTitle("More"),

          _tile(Icons.help_outline, "Help & Support"),
          _tile(Icons.info_outline, "About"),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:  (context) =>LoginPage()  )
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            
            child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _tile(IconData icon, String title, {Widget? trailing}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}