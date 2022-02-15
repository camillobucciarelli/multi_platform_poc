import 'package:data_application_layer/data/entities/meal_category_entity.dart';
import 'package:data_application_layer/domain/models/model_mapper.dart';
import 'package:data_application_layer/domain/repositories/meal_category_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/meal_data_source.dart';

@LazySingleton(as: MealCategoryRepository)
class MealRepositoryImpl implements MealCategoryRepository {
  //final MealDataSource _remoteDataSource;
  final MealDataSource _localDataSource;

  MealRepositoryImpl(
    //@Named('remote') this._remoteDataSource,
    @Named('local') this._localDataSource,
  );

  @override
  Future<Either<Exception, List<M>>> getMealCategories<M>(
    ModelMapper<MealCategoryEntity, M> mapper,
  ) async {
    try {
      final localResponse = await _localDataSource.getCategories();
      /*final List<MealCategoryEntity> categories;
      if (localResponse.categories.isNotEmpty) {
        categories = localResponse.categories;
      } else {
        final remoteResponse = await _remoteDataSource.getCategories();
        categories = remoteResponse.categories;
      }*/
      return Right(localResponse.categories.map(mapper).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
