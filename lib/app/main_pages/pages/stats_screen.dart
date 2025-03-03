import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  // Sample data: cycle lengths for past months
  final List<int> cycleLengths = [28, 30, 27, 29, 31, 28, 32, 30];
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug"
  ];

  // Sample flow intensity data
  final List<int> flowIntensity = [2, 3, 5, 4, 3, 2, 4, 5];
  final List<String> flowLabels = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7",
    "Day 8"
  ];

  // Sample symptoms data
  final Map<String, double> symptomsData = {
    "Cramps": 30,
    "Fatigue": 20,
    "Bloating": 15,
    "Mood Swings": 25,
    "Headache": 10,
  };

  // Colors for pie chart sections
  final List<Color> symptomColors = [
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("📊 Stats"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_rounded),
              ),
            ],
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cycle Length Over Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, _) =>
                                  Text("${value.toInt()}"),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                int index = value.toInt();
                                if (index >= 0 && index < months.length) {
                                  return Text(months[index]);
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                            show: true, border: Border.all(color: Colors.grey)),
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                              cycleLengths.length,
                              (index) => FlSpot(index.toDouble(),
                                  cycleLengths[index].toDouble()),
                            ),
                            isCurved: true,
                            color: Colors.pink,
                            dotData: const FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Flow Intensity Over Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 250,
                    child: BarChart(
                      BarChartData(
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (value, _) {
                                int index = value.toInt();
                                if (index >= 0 && index < flowLabels.length) {
                                  return Text(flowLabels[index],
                                      style: const TextStyle(fontSize: 10));
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, _) =>
                                  Text(value.toInt().toString()),
                            ),
                          ),
                        ),
                        barGroups: List.generate(
                          flowIntensity.length,
                          (index) => BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: flowIntensity[index].toDouble(),
                                color: Colors.blue,
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                        barTouchData: BarTouchData(enabled: true),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Symptoms Breakdown",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: List.generate(
                          symptomsData.length,
                          (index) {
                            String key = symptomsData.keys.elementAt(index);
                            return PieChartSectionData(
                              value: symptomsData[key]!,
                              title: '',
                              radius: 50,
                              color: symptomColors[index],
                              showTitle: false,
                            );
                          },
                        ),
                        sectionsSpace: 4,
                        centerSpaceRadius: 40,
                        pieTouchData: PieTouchData(enabled: true),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8.0,
                    children: List.generate(
                      symptomsData.length,
                      (index) {
                        String key = symptomsData.keys.elementAt(index);
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: symptomColors[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(key),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
