import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RealTimeDataScreen extends StatelessWidget {
  const RealTimeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display real-time data
            const Text(
              'Current Lake Level: 12.3m',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Temperature: -2°C',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Line Chart for data trends
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.pink, width: 2),
                  ),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 1.5),
                        const FlSpot(2, 1.8),
                        const FlSpot(3, 2),
                        const FlSpot(4, 2.5),
                        const FlSpot(5, 3.0),
                        const FlSpot(6, 3.5),
                      ],
                      isCurved: true,
                      color: Colors.pink,
                      barWidth: 2,
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color.fromARGB(255, 0, 255, 195)
                            .withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Refresh button
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Code to refresh data
                },
                child: const Text(
                  'Refresh Data',
                  style: TextStyle(fontSize: 16, color: Colors.amber),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
