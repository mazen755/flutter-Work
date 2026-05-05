import 'package:flutter/material.dart';

class Pageseven extends StatelessWidget {
  const Pageseven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "System Dashboard",
          style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "System Monitoring",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Monitor system health and activity",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),

            _buildSystemStatusBanner(),
            const SizedBox(height: 16),

            _buildMonitorGrid(),

            const SizedBox(height: 32),


            _buildActivityLogsCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


  Widget _buildSystemStatusBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00B894), Color(0xFF00CEA1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.white, size: 32),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Systems Operational",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Last checked: 2 minutes ago",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget _buildMonitorGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildMonitorItem("API Server", "online", "99.9%", Icons.dns_outlined, Colors.green),
        _buildMonitorItem("Database", "online", "99.8%", Icons.storage_outlined, Colors.green),
        _buildMonitorItem("CPU Usage", "45%", "Normal", Icons.memory_outlined, Colors.blue),
        _buildMonitorItem("Storage", "62%", "3.2 TB free", Icons.sd_storage_outlined, Colors.blue),
      ],
    );
  }

  Widget _buildMonitorItem(String title, String status, String sub, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(status, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600)),
              Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildActivityLogsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.bolt, color: Colors.purple, size: 22),
              SizedBox(width: 8),
              Text("Activity Logs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          _buildLogItem("User login", "admin@system.com", "2026-04-22 09:30:15"),
          _buildLogItem("Hall approved", "admin@system.com", "2026-04-22 09:15:30"),
          _buildLogItem("User blocked", "admin@system.com", "2026-04-21 16:45:20"),
          _buildLogItem("Complaint resolved", "admin@system.com", "2026-04-21 14:20:10"),
        ],
      ),
    );
  }

  Widget _buildLogItem(String action, String user, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(action, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text(user, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Text(time, style: const TextStyle(color: Colors.black45, fontSize: 11)),
        ],
      ),
    );
  }
}