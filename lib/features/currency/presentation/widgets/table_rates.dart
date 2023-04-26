import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';

class TableRates extends StatelessWidget {
  final List<CurrencyRate> rates;

  const TableRates({Key? key, required this.rates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Table(
        border: TableBorder.all(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            width: 2,
            color: Colors.black),
        children: [
          const TableRow(children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Date",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Rate",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
          ...rates.reversed
              .toList()
              .map((element) => TableRow(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          element.date,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          element.rate.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ]))
              .toList()
        ],
      ),
    );
  }
}
