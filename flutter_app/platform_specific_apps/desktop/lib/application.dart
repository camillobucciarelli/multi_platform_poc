import 'package:fluent_ui/fluent_ui.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: ScaffoldPage(
        content: Center(
          child: Column(
            children: const [
              Text('I\'m a desktop application'),
            ],
          ),
        ),
      ),
    );
  }
}
