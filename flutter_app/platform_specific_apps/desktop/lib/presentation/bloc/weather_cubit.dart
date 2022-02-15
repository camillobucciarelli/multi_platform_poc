import 'package:bloc/bloc.dart';
import 'package:data_application_layer/data/entities/weather_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_weather_use_case.dart';
import '../../domain/use_cases/send_weather_use_case.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase _getUseCase;
  final SendWeatherUseCase _sendUseCase;

  WeatherCubit(
    this._getUseCase,
    this._sendUseCase,
  ) : super(const WeatherInitial()) {
    _get();
    _send();
  }

  Future<void> _get() async {
    final response = await _getUseCase();
    response.match(
      (l) => emit(WeatherGetError(l.toString())),
      (r) => emit(WeatherGetData(r)),
    );
  }

  Future<void> _send() async {
    final request = Weather('22', '46%', '200 km/h');
    final response = await _sendUseCase(request);
    response.match(
      (l) => emit(WeatherSendError(l.toString())),
      (r) => emit(WeatherSendData(r)),
    );
  }
}
