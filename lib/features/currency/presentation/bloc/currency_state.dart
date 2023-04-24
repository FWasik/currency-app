part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class GetCurrencyRatesState extends CurrencyState {
  final List<CurrencyRate> rates;

  GetCurrencyRatesState({required this.rates});
}

class LoadingState extends CurrencyState {}
