import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/carousel.dart';
import 'constans/decorations.dart';

/// This is an example of a counter application using `provider` + [ChangeNotifier].
///
/// It builds a typical `+` button, with a twist: the texts using the counter
/// are built using the localization framework.
///
/// This shows how to bind our custom [ChangeNotifier] to things like [LocalizationsDelegate].

void main() => runApp(MyApp());

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: Consumer<Counter>(
        builder: (context, counter, _) {
          return MaterialApp(
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Tons of small widgets!
      ///
      /// Splitting our app in small widgets like [Title] or [CounterLabel] is
      /// useful for rebuild optimization.
      ///
      /// Since they are instanciated using `const`, they won't unnecessarily
      /// rebuild when their parent changes.
      /// But they can still have dynamic content, as they can obtain providers!
      ///
      /// This means only the widgets that depends on a provider to rebuild when they change.
      /// Alternatively, we could use [Consumer] or [Selector] to acheive the
      /// same result.
      body: AppBody(),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: mainBackgroundDecoration,
      child: Center(
        child: Container(
          child: CarouselWithState(),
        ),
      ),
    );
  }
}
