import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:currency_app/features/currency/domain/repositories/currency_rate_repo.dart';

class GetCurrencyRates {
  final ICurrencyRate repository;

  GetCurrencyRates({required this.repository});

  Future<List<CurrencyRate>> call({required String currency}) async {
    return await repository.getRates(currency);
  }
}
