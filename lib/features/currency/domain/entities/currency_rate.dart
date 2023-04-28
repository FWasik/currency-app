import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class CurrencyRate extends Equatable {
  final String date;
  final Decimal rate;

  const CurrencyRate({required this.date, required this.rate});

  @override
  List<Object?> get props => [date, rate];
}
