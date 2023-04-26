import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';

class CurrencyRateInfo extends StatelessWidget {
  final CurrencyRate rate;

  const CurrencyRateInfo({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String info =
        "Latest evalution of currency rate to PLN: ${rate.rate} (Date: ${rate.date})";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(12),
          height: 120,
          child: Center(
              child: Text(
            info,
            style: const TextStyle(fontSize: 18),
          ))),
    );
  }
}
