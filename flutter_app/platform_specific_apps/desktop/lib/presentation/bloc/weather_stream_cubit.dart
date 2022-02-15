import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_application_layer/data/entities/update_event.dart';
import 'package:data_application_layer/data/entities/weather_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:platform_app/domain/use_cases/get_weather_stream_use_case.dart';

import '../../domain/use_cases/send_weather_stream_use_case.dart';

part 'weather_stream_state.dart';

@injectable
class WeatherStreamCubit extends Cubit<WeatherState> {
  final GetWeatherStreamUseCase _getUseCase;
  final SendWeatherStreamUseCase _sendUseCase;
  late final StreamSubscription _getSubscription;
  late final StreamSubscription _sendSubscription;

  WeatherStreamCubit(
    this._getUseCase,
    this._sendUseCase,
  ) : super(const WeatherStreamGetData('No data yet')) {
    _get();
    _send();
  }

  void _get() {
    final response = _getUseCase();
    response.match(
      (l) => WeatherStreamGetData(l.toString()),
      (r) {
        _getSubscription = r.listen((event) {
          emit(WeatherStreamGetData(event.toString()));
        });
      },
    );
  }

  void _send() {
    final request = Weather('22', '46%', '200 km/h');
    final response = _sendUseCase(request);
    response.match(
      (l) => null,
      (r) {
        _sendSubscription = r.listen((event) {
          emit(WeatherStreamSendData(event));
        });
      },
    );
  }

  @override
  Future<void> close() {
    _getSubscription.cancel();
    _sendSubscription.cancel();
    return super.close();
  }
}
