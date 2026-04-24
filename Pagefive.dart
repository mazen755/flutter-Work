import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Pagefive extends StatelessWidget {
  const Pagefive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Reports & Analytics",
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
              "Track performance and growth",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),

            _buildStatsRow(),

            const SizedBox(height: 24),

            _buildChartCard(
              title: "Bookings & Revenue",
              icon: Icons.trending_up,
              iconColor: Colors.blue,
              chart: _buildLineChart(),
            ),

            const SizedBox(height: 24),

            _buildChartCard(
              title: "User Growth",
              icon: Icons.group_outlined,
              iconColor: const Color(0xFF8B5CF6),
              chart: _buildBarChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget chart,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(height: 200, child: chart),
        ],
      ),
    );
  }
  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 200,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Jan', 'Feb', 'Mar', 'Apr'];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(days[value.toInt()], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 50,
              getTitlesWidget: (value, meta) => Text(value.toInt().toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 50,
          getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade100, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          _makeGroupData(0, 120),
          _makeGroupData(1, 145),
          _makeGroupData(2, 170),
          _makeGroupData(3, 190),
        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF8B5CF6),
          width: 60,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: "Total Bookings",
            value: "183",
            percentage: "+23% this month",
            icon: Icons.calendar_month,
            iconColor: Colors.blue,
            iconBg: const Color(0xFFE0F2FE),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            title: "Revenue",
            value: "\$152K",
            percentage: "+18% this month",
            icon: Icons.attach_money,
            iconColor: Colors.green,
            iconBg: const Color(0xFFDCFCE7),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({required String title, required String value, required String percentage, required IconData icon, required Color iconColor, required Color iconBg}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12.withOpacity(0.05))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: iconColor, size: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ]))
        ]),
        const SizedBox(height: 12),
        Text(percentage, style: const TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500)),
      ]),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true, horizontalInterval: 55000, getDrawingHorizontalLine: (v) => FlLine(color: Colors.grey.shade100), getDrawingVerticalLine: (v) => FlLine(color: Colors.grey.shade100, dashArray: [5, 5])),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 55000, reservedSize: 45, getTitlesWidget: (v, m) => Text(v.toInt().toString(), style: const TextStyle(color: Colors.grey, fontSize: 10)))),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (v, m) {
            const d = ['Jan', 'Feb', 'Mar', 'Apr'];
            return (v >= 0 && v < 4) ? Padding(padding: const EdgeInsets.only(top: 8), child: Text(d[v.toInt()], style: const TextStyle(color: Colors.grey, fontSize: 12))) : const SizedBox();
          })),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(spots: [const FlSpot(0, 0), const FlSpot(1, 100000), const FlSpot(2, 55000), const FlSpot(3, 150000)], isCurved: true, color: const Color(0xFF10B981), barWidth: 3, dotData: const FlDotData(show: true)),
        ],
      ),
    );
  }
}