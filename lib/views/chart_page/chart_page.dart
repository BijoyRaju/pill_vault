import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/views/chart_page/widgets/custom_container.dart';

class ChartPage extends StatelessWidget {
  final List<Database> medicines;

  const ChartPage({super.key, required this.medicines});

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < medicines.length; i++) {
      final price = medicines[i].price;
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: price.toDouble(),
              width: 20,
              color: Colors.teal,
              borderRadius: BorderRadius.circular(6),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar:AppBar(
        title: Text(TextConstants.chartPageTitle,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),),
        automaticallyImplyLeading: false,
      ) ,
      body: SafeArea(
        child: Column(
          children:[
            SizedBox(height: 10,),
            CustomContainer(contexts: "Total Medicine : ${medicines.length}"),
            SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  barGroups: barGroups,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          return Text(
                            medicines[index].medicineName,
                            style: const TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
