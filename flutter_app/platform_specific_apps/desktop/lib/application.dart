import 'package:fluent_ui/fluent_ui.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      home: ScaffoldPage(
        content: Center(
          child: Text('I\'m a desktop application'),
        ),
      ),
    );
  }
}
