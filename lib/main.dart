import 'package:currency_app/features/currency/data/datasources/currency_rate_data_source.dart';
import 'package:currency_app/features/currency/data/repositories/currency_rate_repo_impl.dart';
import 'package:currency_app/features/currency/domain/usecases/get_currency_rates.dart';
import 'package:currency_app/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:currency_app/features/currency/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyBloc(
          getUseCaseRates: GetCurrencyRates(
              repository: CurrencyRateRepoImpl(
                  currencyRatesDataSource: CurrencyRatesDataSource()))),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.dark, primaryColorDark: Colors.indigo),
        home: const HomePage(),
      ),
    );
  }
}
