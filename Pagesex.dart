import 'package:flutter/material.dart';

class Pagesex extends StatelessWidget {
  const Pagesex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Account Management",
          style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
                "Account Control",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            const Text(
                "Monitor and manage suspicious activity",
                style: TextStyle(color: Colors.grey, fontSize: 14)
            ),
            const SizedBox(height: 20),


            _buildSecurityAlert(),

            const SizedBox(height: 16),


            _buildAccountInvestigationCard(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


  Widget _buildSecurityAlert() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(

        gradient: const LinearGradient(
          colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.shield_outlined, color: Colors.white, size: 35),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Security Alert",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
              ),
              Text(
                  "1 accounts need attention",
                  style: TextStyle(color: Colors.white70, fontSize: 14)
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAccountInvestigationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        border: const Border(left: BorderSide(color: Colors.orange, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFFFF3E0),
                child: Icon(Icons.warning_amber_rounded, color: Colors.orange),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Mike Johnson",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                    ),
                    Text(
                        "mike@example.com",
                        style: TextStyle(color: Colors.grey, fontSize: 14)
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              _buildBadge("Currently Blocked", Colors.red),
              const SizedBox(width: 8),
              _buildBadge("Low Activity", Colors.orange),
            ],
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2979FF),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.visibility_outlined, size: 18, color: Colors.white),
                SizedBox(width: 8),
                Text(
                    "Investigate",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
          text,
          style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)
      ),
    );
  }
}