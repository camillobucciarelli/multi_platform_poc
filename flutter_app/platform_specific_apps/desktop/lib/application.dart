import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_app/dependency_injection/dependency_injection.dart';
import 'package:platform_app/presentation/bloc/meal_categories_cubit.dart';
import 'package:platform_app/presentation/bloc/weather_cubit.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      home: WeatherView(),
    );
  }
}

class MealCategories extends StatelessWidget {
  const MealCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MealCategoriesCubit>(
      create: (context) => injector(),
      child: ScaffoldPage(
        content: BlocBuilder<MealCategoriesCubit, MealCategoriesState>(
          builder: (context, state) {
            if (state is MealCategoriesLoading) {
              return const Center(
                child: ProgressRing(),
              );
            }
            if (state is MealCategoriesError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is MealCategoriesSuccess) {
              return ListView.builder(
                itemCount: state.models.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    title: Text(state.models[index].name),
                    subtitle: Text(
                      state.models[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    leading: Container(
                      width: kThreeLineTileHeight,
                      height: kThreeLineTileHeight,
                      decoration: BoxDecoration(
                        color: Colors.blue.lightest,
                        image: DecorationImage(
                          image: NetworkImage(state.models[index].thumbnail),
                          onError: (_, __) {},
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => injector(),
      child: ScaffoldPage(
        content: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherData) {
              return Center(child: Text(state.data.toString()));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
