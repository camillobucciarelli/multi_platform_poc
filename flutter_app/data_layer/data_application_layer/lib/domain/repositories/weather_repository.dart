abstract class WeatherRepository {
  Future<Stream<String>> getTemperatures();
}
