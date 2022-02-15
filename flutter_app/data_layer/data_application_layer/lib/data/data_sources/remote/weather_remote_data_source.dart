import 'package:data_application_layer/data/data_sources/weather_data_source.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WeatherDataSource)
class WeatherRemoteDataSource implements WeatherDataSource {
  final Client _client = Client();
  final Dio _clientDio = Dio();
  @override
  Future<Stream<String>> getTemperatures() async {
    Uri url = Uri.parse(r'http://localhost:8080/weather-stream');
    Request request = Request("GET", url);
    StreamedResponse streamedResponse = await _client.send(request);
    return streamedResponse.stream.toStringStream();
  }
}
