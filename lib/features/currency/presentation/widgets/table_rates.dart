import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:flutter/material.dart';

class TableRates extends StatelessWidget {
  final List<CurrencyRate> rates;

  const TableRates({Key? key, required this.rates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Table(
        border: TableBorder.all(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.black),
        children: [
          TableRow(children: [_buildHeader("Dates"), _buildHeader("Rates")]),
          ...rates
              .map((element) => TableRow(children: [
                    _buildCell(element.date),
                    _buildCell(element.rate.toString())
                  ]))
              .toList()
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCell(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
        ),
      ),
    );
  }
}
