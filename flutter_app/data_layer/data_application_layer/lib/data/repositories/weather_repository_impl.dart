import 'package:data_application_layer/data/data_sources/weather_data_source.dart';
import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl(this._dataSource);

  @override
  Stream getTemperatures() => _dataSource.getTemperatures();
}
