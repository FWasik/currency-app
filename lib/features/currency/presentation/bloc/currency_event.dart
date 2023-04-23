part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class GetCurrencyRatesEvent extends CurrencyEvent {
  final String currency;

  const GetCurrencyRatesEvent({required this.currency});

  @override
  List<Object> get props => [currency];
}
