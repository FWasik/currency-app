import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:currency_app/features/currency/presentation/widgets/currency_button.dart';
import 'package:currency_app/features/currency/presentation/widgets/currency_rate_info.dart';
import 'package:currency_app/features/currency/presentation/widgets/custom_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Currencies rates dashboard"),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body:
            BlocBuilder<CurrencyBloc, CurrencyState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.black26,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(style: BorderStyle.solid)),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CurrencyButton(currency: "EUR"),
                      const CurrencyButton(currency: "USD")
                    ],
                  ),
                ),
                if (state is GetCurrencyRatesState) ...[
                  Expanded(
                      child: ListView(
                    children: [
                      CurrencyRateInfo(
                        rate: state.rates[state.rates.length - 1],
                      ),
                      CustomChart(rates: state.rates),
                    ],
                  ))
                ] else if (state is LoadingState) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ] else ...[
                  const SizedBox(
                    height: 300,
                    child: Center(
                        child: Text(
                      "Choose currency to check rate to PLN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    )),
                  ),
                ]
              ],
            ),
          );
        }));
  }
}
