import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:currency_app/features/currency/presentation/widgets/currency_rate_info.dart';
import 'package:currency_app/features/currency/presentation/widgets/chart_rates.dart';
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
  String dropdownValue = "Chart";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Currencies rates dashboard",
              style: TextStyle(fontSize: 24),
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            bottom: TabBar(
                onTap: _handleTabBarTapped,
                indicatorWeight: 10,
                indicatorColor: Theme.of(context).primaryColorDark,
                tabs: _tabs),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<CurrencyBloc, CurrencyState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  EasyLoading.show(status: "Loading...");
                } else {
                  EasyLoading.dismiss();
                }
              },
              builder: (context, state) {
                if (state is GetCurrencyRatesState) {
                  return ListView(
                    children: [
                      CurrencyRateInfo(
                        rate: state.rates[state.rates.length - 1],
                      ),
                      CustomDropdown(
                          dropdownValue: dropdownValue,
                          onArgumentChanged: handleArgumentChanged),
                      dropdownValue == "Chart"
                          ? ChartRates(rates: state.rates)
                          : TableRates(rates: state.rates)
                    ],
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )),
    );
  }

  final List<Widget> _tabs = [
    const Tab(
      child: Text(
        "EUR",
        style: TextStyle(fontSize: 22),
      ),
    ),
    const Tab(
      child: Text(
        "USD",
        style: TextStyle(fontSize: 22),
      ),
    )
  ];

  void handleArgumentChanged(String newDropdownValue) {
    setState(() {
      dropdownValue = newDropdownValue;
    });
  }

  void _handleTabBarTapped(int value) {
    switch (value) {
      case 0:
        context
            .read<CurrencyBloc>()
            .add(const GetCurrencyRatesEvent(currency: "EUR"));
        break;
      case 1:
        context
            .read<CurrencyBloc>()
            .add(const GetCurrencyRatesEvent(currency: "USD"));
        break;
      default:
    }
  }
}
