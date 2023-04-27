import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartRates extends StatelessWidget {
  final List<CurrencyRate> rates;

  const BarChartRates({Key? key, required this.rates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(style: BorderStyle.solid)),
          height: 1000,
          child: SfCartesianChart(
              title: ChartTitle(
                  text: "Currency Rates",
                  textStyle: const TextStyle(fontSize: 18)),
              primaryXAxis: CategoryAxis(title: AxisTitle(text: "Dates")),
              primaryYAxis: NumericAxis(title: AxisTitle(text: "Rates")),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<CurrencyRate, String>>[
                BarSeries<CurrencyRate, String>(
                  animationDuration: 500,
                  animationDelay: 200,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  dataSource: rates,
                  xValueMapper: (CurrencyRate rate, _) => rate.date,
                  yValueMapper: (CurrencyRate data, _) => data.rate.toDouble(),
                  name: 'Rate',
                  color: Theme.of(context).primaryColorDark,
                  sortingOrder: SortingOrder.ascending,
                  sortFieldValueMapper: (CurrencyRate rate, _) => rate.date,
                ),
              ])),
    );
  }
}
