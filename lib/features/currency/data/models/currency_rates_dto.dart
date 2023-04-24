import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:decimal/decimal.dart';

class CurrencyRateDTO extends CurrencyRate {
  const CurrencyRateDTO({required number, required date, required rate})
      : super(number: number, date: date, rate: rate);

  factory CurrencyRateDTO.fromJson(Map<String, dynamic> json) {
    return CurrencyRateDTO(
        number: json["no"],
        date: json["effectiveDate"],
        rate: Decimal.parse(json["mid"].toString()));
  }
}
