part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class FetchedRatesState extends CurrencyState {
  final List<CurrencyRate> rates;

  FetchedRatesState({required this.rates});

  @override
  List<Object> get props => [rates];
}

class ErrorState extends CurrencyState {
  final String error;

  ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class LoadingState extends CurrencyState {}
