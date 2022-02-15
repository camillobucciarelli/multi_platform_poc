import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/dependency_injection.dart';
import '../bloc/weather_cubit.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => injector(),
      child: ScaffoldPage(
        content: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Weather get'),
                  const SizedBox(height: 16),
                  BlocBuilder<WeatherCubit, WeatherState>(
                    buildWhen: (previous, current) => current is WeatherGetData,
                    builder: (context, state) {
                      if (state is WeatherGetData) {
                        return Text(
                          state.weather.toString(),
                          textAlign: TextAlign.center,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Weather send'),
                  const SizedBox(height: 16),
                  BlocBuilder<WeatherCubit, WeatherState>(
                    buildWhen: (p, c) => c is WeatherSendData || c is WeatherSendError,
                    builder: (context, state) {
                      if (state is WeatherSendError) {
                        return Text(
                          state.error,
                          textAlign: TextAlign.center,
                        );
                      }
                      if (state is WeatherSendData) {
                        return Text(
                          state.weather.toString(),
                          textAlign: TextAlign.center,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
