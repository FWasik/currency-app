import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';

class CurrencyRateInfo extends StatelessWidget {
  final CurrencyRate rate;
  final String? chosenCurr;

  const CurrencyRateInfo(
      {Key? key, required this.rate, required this.chosenCurr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(12),
          height: 120,
          child: Center(
              child: RichText(
            text: TextSpan(
                text: "Latest evaluation of currency $chosenCurr to PLN: ",
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: "${rate.rate} (Date: ${rate.date})",
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ]),
          ))),
    );
  }
}
