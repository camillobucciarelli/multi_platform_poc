import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_app/dependency_injection/dependency_injection.dart';
import 'package:platform_app/presentation/bloc/meal_categories_cubit.dart';
import 'package:platform_app/presentation/widgets/weather_view.dart';

import 'presentation/widgets/weather_stream_view.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: NavigationView(
        appBar: const NavigationAppBar(
          title: Text('Multi platform POC'),
        ),
        pane: NavigationPane(
          selected: _index,
          onChanged: (index) => setState(() => _index = index),
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.dataflows),
              title: const Text('Stream'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.download),
              title: const Text('Normal'),
            ),
          ],
        ),
        content: NavigationBody(
          index: _index,
          children: const [
            WeatherStreamView(),
            WeatherView(),
          ],
        ),
      ),
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
