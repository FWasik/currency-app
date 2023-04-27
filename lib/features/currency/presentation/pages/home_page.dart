import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:currency_app/features/currency/presentation/widgets/bar_chart_rates.dart';
import 'package:currency_app/features/currency/presentation/widgets/line_chart_rates.dart';
import 'package:currency_app/features/currency/presentation/widgets/currency_rate_info.dart';
import 'package:currency_app/features/currency/presentation/widgets/custom_dropdown.dart';
import 'package:currency_app/features/currency/presentation/widgets/table_rates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownPresentationValue = "Table";
  String dropdownCurrValue = "EUR";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Currencies rates dashboard",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomDropdown(
                dropdownValue: dropdownCurrValue,
                onChanged: handleCurrencyChanged,
                list: const ["EUR", "USD"],
              ),
              CustomDropdown(
                dropdownValue: dropdownPresentationValue,
                onChanged: handlePresentationChanged,
                list: const ["Bar Chart", "Line Chart", "Table"],
              ),
            ],
          ),
          BlocConsumer<CurrencyBloc, CurrencyState>(
            listener: (context, state) {
              if (state is LoadingState) {
                EasyLoading.show(status: "Loading...");
              } else {
                EasyLoading.dismiss();
              }
            },
            builder: (context, state) {
              if (state is GetCurrencyRatesState) {
                return Column(children: [
                  CurrencyRateInfo(
                    rate: state.rates.first,
                    chosenCurr: dropdownCurrValue,
                  ),
                  if (dropdownPresentationValue == "Line Chart") ...[
                    LineChartRates(rates: state.rates)
                  ] else if (dropdownPresentationValue == "Bar Chart") ...[
                    BarChartRates(rates: state.rates)
                  ] else ...[
                    TableRates(rates: state.rates)
                  ]
                ]);
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return Container();
              }
            },
          ),
        ]),
      ),
    );
  }

  void handlePresentationChanged(String newDropdownValue) {
    setState(() {
      dropdownPresentationValue = newDropdownValue;
    });
  }

  void handleCurrencyChanged(String newDropdownValue) {
    setState(() {
      dropdownCurrValue = newDropdownValue;
    });

    switch (dropdownCurrValue) {
      case "EUR":
        context
            .read<CurrencyBloc>()
            .add(const GetCurrencyRatesEvent(currency: "EUR"));
        break;
      case "USD":
        context
            .read<CurrencyBloc>()
            .add(const GetCurrencyRatesEvent(currency: "USD"));
        break;
      default:
    }
  }
}
