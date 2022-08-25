import 'package:flutter/material.dart';
import 'package:flutter_stock_ticker/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ChartData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            series: <CandleSeries>[
              CandleSeries<ChartData, DateTime>(
                  dataSource: _chartData,
                  xValueMapper: (ChartData data, _) => data.date,
                  lowValueMapper: (ChartData data, _) => data.low,
                  highValueMapper: (ChartData data, _) => data.high,
                  openValueMapper: (ChartData data, _) => data.open,
                  closeValueMapper: ((ChartData data, _) => data.close))
            ],
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMM(),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
                minimum: 70,
                maximum: 130,
                interval: 10,
                numberFormat: NumberFormat.simpleCurrency()),
          ),
        ),
      ),
    );
  }

  List<ChartData> getChartData() {
    return <ChartData>[
      ChartData(
          date: DateTime(2022, 03, 25),
          open: 25.3,
          high: 13.4,
          low: 23.5,
          close: 14.9),
      ChartData(
          date: DateTime(2022, 04, 23),
          open: 15.3,
          high: 23.4,
          low: 17.5,
          close: 16.9),
      ChartData(
          date: DateTime(2022, 05, 30),
          open: 13.3,
          high: 14.4,
          low: 12.5,
          close: 13.9),
      ChartData(
          date: DateTime(2022, 06, 12),
          open: 15.3,
          high: 19.4,
          low: 24.5,
          close: 24.9),
      ChartData(
          date: DateTime(2022, 07, 15),
          open: 15.3,
          high: 16.4,
          low: 29.5,
          close: 19.9),
      ChartData(
          date: DateTime(2022, 08, 20),
          open: 35.3,
          high: 33.4,
          low: 20.5,
          close: 31.9),
    ];
  }
}
