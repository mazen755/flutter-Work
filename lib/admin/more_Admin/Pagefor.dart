import 'package:flutter/material.dart';

class ModerationReport {
  final String title;
  final String user;
  final String status;

  ModerationReport({
    required this.title,
    required this.user,
    required this.status,
  });
}

class Pagefor extends StatefulWidget {
  const Pagefor({super.key});

  @override
  State<Pagefor> createState() => _PageforState();
}

class _PageforState extends State<Pagefor> {
  List<ModerationReport> reports = [
    ModerationReport(
      title: "Inappropriate content",
      user: "Ahmed Ali",
      status: "Pending",
    ),
    ModerationReport(
      title: "Spam",
      user: "Sara Mohamed",
      status: "Reviewed",
    ),
    ModerationReport(
      title: "Abuse",
      user: "Mike Johnson",
      status: "Pending",
    ),
  ];

  void deleteItem(int index) {
    setState(() {
      reports.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Moderation"),
            Text(
              "Review reported content",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.warning, color: Colors.white),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "by ${report.user}",
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: report.status == "Pending"
                        ? Colors.orange.withOpacity(0.2)
                        : Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    report.status,
                    style: TextStyle(
                      color: report.status == "Pending"
                          ? Colors.orange
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                IconButton(
                  onPressed: () => deleteItem(index),
                  icon: Icon(Icons.delete, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}