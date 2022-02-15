import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/dependency_injection.dart';
import '../bloc/weather_stream_cubit.dart';

class WeatherStreamView extends StatelessWidget {
  const WeatherStreamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherStreamCubit>(
      create: (context) => injector(),
      child: ScaffoldPage(
        content: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Weather get stream'),
                  const SizedBox(height: 16),
                  BlocBuilder<WeatherStreamCubit, WeatherState>(
                    buildWhen: (previous, current) => current is WeatherStreamGetData,
                    builder: (context, state) {
                      if (state is WeatherStreamGetData) {
                        return Text(
                          state.data.toString(),
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
                  const Text('Weather send stream'),
                  const SizedBox(height: 16),
                  BlocBuilder<WeatherStreamCubit, WeatherState>(
                    buildWhen: (previous, current) => current is WeatherStreamSendData,
                    builder: (context, state) {
                      if (state is WeatherStreamSendData) {
                        return ProgressBar(
                          value: state.data.percentage.toDouble(),
                          strokeWidth: 9,
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
