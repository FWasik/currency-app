import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyButton extends StatelessWidget {
  final String currency;

  const CurrencyButton({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColorDark,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            minimumSize: const Size(100, 50)),
        onPressed: () {
          BlocProvider.of<CurrencyBloc>(context)
              .add(GetCurrencyRatesEvent(currency: currency));
        },
        child: Text(
          currency,
          style: const TextStyle(fontSize: 24),
        ));
  }
}
