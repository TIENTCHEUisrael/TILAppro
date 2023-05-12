import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatistiqueCard extends StatelessWidget {
  const StatistiqueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: PageView(
        children: [
          PieChart(
            PieChartData(
              sections: data,
              centerSpaceRadius: 0,
              sectionsSpace: 10,
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: 'A', color: Colors.red),
  PieChartSectionData(title: 'B', color: Colors.green),
  PieChartSectionData(title: 'C', color: Colors.orange),
  PieChartSectionData(title: 'D', color: Colors.yellow),
];
