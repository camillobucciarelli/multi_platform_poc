import 'package:data_application_layer/data/data_sources/meal_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../entities/meal_categories_response_entity.dart';

part 'meal_remote_data_source.g.dart';

@Named('remote')
@LazySingleton(as: MealDataSource)
@RestApi(baseUrl: 'http://www.themealdb.com/api/json/v1/1')
abstract class MealRemoteDataSource implements MealDataSource {
  @factoryMethod
  factory MealRemoteDataSource(Dio dio) = _MealRemoteDataSource;

  @override
  @GET('/categories.php')
  Future<MealCategoriesResponseEntity> getCategories();
}
