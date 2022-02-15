import 'package:data_application_layer/data/data_sources/weather_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: WeatherDataSource)
class WeatherRemoteDataSource implements WeatherDataSource {
  @override
  Stream getTemperatures() {
    return http.get(Uri.parse('http://192.168.129.245:8080/weather-stream')).asStream();
  }
}
