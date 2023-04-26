import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class ChartRates extends StatelessWidget {
  final List<CurrencyRate> rates;

  const ChartRates({Key? key, required this.rates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(style: BorderStyle.solid)),
          height: 600,
          width: 1400,
          child: Chart(
            data: rates,
            variables: {
              "date": Variable(accessor: (CurrencyRate rate) => rate.date),
              "rate": Variable(
                  accessor: (CurrencyRate rate) => rate.rate.toDouble(),
                  scale: LinearScale(
                      tickCount: 8,
                      formatter: (v) => v.toDouble().toStringAsFixed(2)))
            },
            marks: [
              IntervalMark(
                  color:
                      ColorEncode(variable: 'rate', values: Defaults.colors10),
                  modifiers: [StackModifier()],
                  transition:
                      Transition(duration: const Duration(milliseconds: 500)),
                  entrance: {MarkEntrance.y},
                  label: LabelEncode(
                      encoder: (tuple) => Label(
                            tuple['rate'].toString(),
                            LabelStyle(
                                textStyle: const TextStyle(fontSize: 14)),
                          )))
            ],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        ),
      ),
    );
  }
}
