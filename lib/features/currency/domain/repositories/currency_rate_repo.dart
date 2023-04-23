import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';

abstract class ICurrencyRate {
  Future<List<CurrencyRate>> getRates(String currency);
}
