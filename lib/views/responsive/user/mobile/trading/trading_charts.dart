// ignore_for_file: must_be_immutable

import 'package:compassinvest/models/trading_profit.dart';
import 'package:compassinvest/models/trading_profit_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class TradingChartPage extends StatefulWidget {
   TradingChartPage({Key? key, required this.profits}) : super(key: key);
  late List<TradingProfit> profits;

  @override
  _TradingChartPageState createState() => _TradingChartPageState();
}

class _TradingChartPageState extends State<TradingChartPage> {
  late List<TradingProfitData> profitData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    profitData = [];
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profits = Provider.of<List<TradingProfitData>>(context);

    return SfCartesianChart(
        tooltipBehavior: _tooltipBehavior,
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          ColumnSeries<ProfitData, String>(
              animationDuration: 4500,
              enableTooltip: true,
              dataSource: [
                for (int i = 0; i < profits.length; i++)
                  ProfitData(
                      DateFormat("yyyy-MM-dd")
                          .format(profits[i].created_at)
                          .toString(),
                      profits[i].profit!.toDouble()),
              ],
              xValueMapper: (ProfitData sales, _) => sales.time,
              yValueMapper: (ProfitData sales, _) => sales.profit,
              borderColor: const Color(0xffD5DFE5),
              color: const Color(0xff189767),
              borderWidth: 2,
              emptyPointSettings: EmptyPointSettings(
                  mode: EmptyPointMode.average,
                  color: Colors.red,
                  borderColor: Colors.black,
                  borderWidth: 2))
        ]);
  }
}

class ProfitData {
  ProfitData(this.time, this.profit);
  final String time;
  final double profit;
}
