import 'package:flutter/material.dart';

void main() {
  runApp(const HallOwnersApp());
}

class HallOwnersApp extends StatelessWidget {
  const HallOwnersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hall Owners Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationScreen(),
    );
  }
}

enum OwnerStatus { approved, pending, rejected }

class Owner {
  final String id;
  final String name;
  final String ownerName;
  final String email;
  final int halls;
  final double revenue;
  OwnerStatus status;

  Owner({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.email,
    required this.halls,
    required this.revenue,
    this.status = OwnerStatus.pending,
  });
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 2;

  final List<Owner> _owners = [
    Owner(id: '1', name: 'Grand Hotels Inc.', ownerName: 'Robert Chen', email: 'robert@grandhotels.com', halls: 5, revenue: 45000),
    Owner(id: '2', name: 'Elite Venues', ownerName: 'Maria Garcia', email: 'maria@elitevenues.com', halls: 3, revenue: 32000),
    Owner(id: '3', name: 'Luxe Spaces', ownerName: 'James Taylor', email: 'james@luxespaces.com', halls: 2, revenue: 0),
    Owner(id: '4', name: 'Premium Events Co.', ownerName: 'Lisa Anderson', email: 'lisa@premiumevents.com', halls: 1, revenue: 0),
  ];

  void _setStatus(String id, OwnerStatus newStatus) {
    setState(() {
      _owners.firstWhere((o) => o.id == id).status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFC),
      body: _selectedIndex == 2
          ? SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text('Hall Owners', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _owners.length,
                itemBuilder: (context, index) => OwnerCard(
                  owner: _owners[index],
                  onUpdate: _setStatus,
                ),
              ),
            ),
          ],
        ),
      )
          : Center(),

    );
  }
}

class OwnerCard extends StatelessWidget {
  final Owner owner;
  final Function(String, OwnerStatus) onUpdate;

  const OwnerCard({super.key, required this.owner, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          _buildLeadingIcon(),
          const SizedBox(width: 16),
          Expanded(child: _buildInfoSection()),
          _buildActionSection(context),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [Colors.pink, Colors.purple]),
      ),
      child: const Icon(Icons.business, color: Colors.white),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(owner.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Text(owner.ownerName, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 4),
        Text('${owner.halls} halls   \$${owner.revenue.toInt()}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 8),
        StatusTag(status: owner.status),
      ],
    );
  }

  Widget _buildActionSection(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.visibility_outlined, color: Colors.blue),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => DetailScreen(owner: owner, onUpdate: onUpdate)),
          ),
        ),
        if (owner.status == OwnerStatus.pending) ...[
          IconButton(icon: const Icon(Icons.check_circle_outline, color: Colors.green), onPressed: () => onUpdate(owner.id, OwnerStatus.approved)),
          IconButton(icon: const Icon(Icons.highlight_off, color: Colors.red), onPressed: () => onUpdate(owner.id, OwnerStatus.rejected)),
        ]
      ],
    );
  }
}

class StatusTag extends StatelessWidget {
  final OwnerStatus status;
  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = {
      OwnerStatus.approved: [Colors.green.shade50, Colors.green, 'approved'],
      OwnerStatus.pending: [Colors.orange.shade50, Colors.orange, 'pending'],
      OwnerStatus.rejected: [Colors.red.shade50, Colors.red, 'rejected'],
    }[status]!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: config[0] as Color, borderRadius: BorderRadius.circular(12)),
      child: Text(config[2] as String, style: TextStyle(color: config[1] as Color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Owner owner;
  final Function(String, OwnerStatus) onUpdate;

  const DetailScreen({super.key, required this.owner, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Back to owners', style: TextStyle(color: Colors.blue, fontSize: 16)), leading: const BackButton(color: Colors.blue)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(owner.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('Owner: ${owner.ownerName}', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),
                  StatusTag(status: owner.status),
                  const SizedBox(height: 30),
                  _tile(Icons.email, 'Email', owner.email),
                  _tile(Icons.business, 'Total Halls', '${owner.halls}'),
                  _tile(Icons.attach_money, 'Revenue', '\$${owner.revenue.toInt()}'),
                  const SizedBox(height: 30),
                  if (owner.status == OwnerStatus.pending)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              onUpdate(owner.id, OwnerStatus.approved);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: const Text('Approve', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              onUpdate(owner.id, OwnerStatus.rejected);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: const Text('Reject', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String label, String val) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(val, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}