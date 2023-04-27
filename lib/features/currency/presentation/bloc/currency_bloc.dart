import 'package:bloc/bloc.dart';
import 'package:currency_app/features/currency/domain/entities/currency_rate.dart';
import 'package:currency_app/features/currency/domain/usecases/get_currency_rates.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  GetCurrencyRates getUseCaseRates;

  CurrencyBloc({required this.getUseCaseRates}) : super(CurrencyInitial()) {
    on<GetCurrencyRatesEvent>((event, emit) async {
      try {
        emit(LoadingState());

        List<CurrencyRate> rates =
            await getUseCaseRates.call(currency: event.currency);

        emit(GetCurrencyRatesState(rates: rates.reversed.toList()));
      } on Exception catch (e) {
        emit(ErrorState(error: e.toString()));
      }
    });
  }
}
