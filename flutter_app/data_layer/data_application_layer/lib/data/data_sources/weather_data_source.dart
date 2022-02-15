abstract class WeatherDataSource {
  Future<Stream<String>> getTemperatures();
}
