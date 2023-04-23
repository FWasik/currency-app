import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (contextCurrency, stateCurrency) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Currency exchanger"),
                backgroundColor: Theme.of(context).primaryColorDark,
                bottom: TabBar(
                    indicatorWeight: 10,
                    indicatorColor: Theme.of(context).primaryColorDark,
                    unselectedLabelColor: Colors.white,
                    onTap: (value) {
                      if (value == 0) {
                        context
                            .read<CurrencyBloc>()
                            .add(GetCurrencyRatesEvent(currency: "EUR"));
                        print("EUR");
                      } else if (value == 1) {
                        print("USD");
                        context
                            .read<CurrencyBloc>()
                            .add(GetCurrencyRatesEvent(currency: "USD"));
                        print("USD");
                      }
                    },
                    tabs: [
                      Tab(
                        text: "EUR",
                      ),
                      Tab(
                        text: "USD",
                      )
                    ]),
              ),
              body: stateCurrency is GetCurrencyRatesState
                  ? TabBarView(children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 120),
                          // implement the bar chart
                          child: BarChart(BarChartData(
                              borderData: FlBorderData(
                                  border: const Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(width: 1),
                                bottom: BorderSide(width: 1),
                              )),
                              groupsSpace: 10,

                              // add bars
                              barGroups: [
                                BarChartGroupData(x: 1, barRods: [
                                  BarChartRodData(
                                      toY: 10, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 2, barRods: [
                                  BarChartRodData(
                                      toY: 9, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 3, barRods: [
                                  BarChartRodData(
                                      toY: 4, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 4, barRods: [
                                  BarChartRodData(
                                      toY: 2, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 5, barRods: [
                                  BarChartRodData(
                                      toY: 13, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 6, barRods: [
                                  BarChartRodData(
                                      toY: 17, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 7, barRods: [
                                  BarChartRodData(
                                      toY: 19, width: 15, color: Colors.amber),
                                ]),
                                BarChartGroupData(x: 8, barRods: [
                                  BarChartRodData(
                                      toY: 21, width: 15, color: Colors.amber),
                                ]),
                              ])),
                        ),
                      ),
                      Center(child: Text("Dolar"))
                    ])
                  : Center(child: CircularProgressIndicator()));
        }));
  }
}
