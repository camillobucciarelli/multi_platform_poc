import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:platform_app/domain/use_cases/get_weather_stream_use_case.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherStreamUseCase _useCase;
  late final StreamSubscription _subscription;

  WeatherCubit(this._useCase) : super(const WeatherData(null)) {
    _subscription = _useCase().listen((event) {
      emit(WeatherData(event));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
