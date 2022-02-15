// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MealRemoteDataSource implements MealRemoteDataSource {
  _MealRemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://www.themealdb.com/api/json/v1/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MealCategoriesResponseEntity> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MealCategoriesResponseEntity>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/categories.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MealCategoriesResponseEntity.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
