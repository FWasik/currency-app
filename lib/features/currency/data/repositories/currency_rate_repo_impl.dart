import 'package:currency_app/features/currency/data/datasources/currency_rate_data_source.dart';
import 'package:currency_app/features/currency/data/models/currency_rates_dto.dart';
import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:currency_app/features/currency/domain/repositories/currency_rate_repo.dart';

class CurrencyRateRepoImpl implements ICurrencyRate {
  final CurrencyRatesDataSource currencyRatesDataSource;

  CurrencyRateRepoImpl({required this.currencyRatesDataSource});

  @override
  Future<List<CurrencyRate>> getRates(String currency) async {
    final json = await currencyRatesDataSource.fetchRates(currency);

    List<CurrencyRate> currencyRates = [];

    for (Map<String, dynamic> rate in json!["rates"]) {
      currencyRates.add(CurrencyRateDTO.fromJson(rate));
    }

    return currencyRates;
  }
}
