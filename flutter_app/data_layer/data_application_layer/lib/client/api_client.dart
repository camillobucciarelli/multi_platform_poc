import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final _client = Client();
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) {
    return _client.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
  }

  Future<Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _client.post(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
        if (headers != null) ...headers,
      },
    );
  }

  Stream<T> getStreamed<T>(
    String endpoint, {
    required ResponseMapper<T> responseMapper,
  }) async* {
    final request = Request('GET', Uri.parse('$baseUrl$endpoint'));
    final response = await _client.send(request);
    yield* response.stream.toStringStream().map((e) => responseMapper(jsonDecode(e)));
  }

  Stream<T> postStreamed<T>(
    String endpoint, {
    required ResponseMapper<T> responseMapper,
    Map<String, String>? headers,
    Object? body,
  }) async* {
    final request = Request('POST', Uri.parse('$baseUrl$endpoint'))
      ..headers['content-type'] = 'application/json'
      ..body = jsonEncode(body);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    final response = await _client.send(request);
    yield* response.stream.toStringStream().map((e) => responseMapper(jsonDecode(e)));
  }
}

typedef ResponseMapper<O> = O Function(Object? response);
