import 'package:easy_localization/easy_localization.dart';
import 'package:logbook/gen/assets.gen.dart';
import 'package:logbook/src/constant/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logbook/src/app/app_cubit.dart';
import 'package:logbook/src/constant/app_theme.dart';
import 'package:logbook/src/di/injections.dart';
import 'package:logbook/translations/locale_keys.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppCubit>(
          lazy: false,
          create: (BuildContext context) {
            return getIt<AppCubit>();
          },
        ),
      ],
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: AppTheme().themeData,
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      );

  Route<dynamic> generateRoute(RouteSettings settings) {
    bool isLogin = true;
    switch (settings.name) {
      case '/':
        if (isLogin) {
          return MainPage.route();
        }
      default:
        return MaterialPageRoute<void>(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  static Route<MainPage> route() {
    return PageRouteBuilder<MainPage>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return const MainPage(
          title: "main",
        );
      },
    );
  }

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.images.icAndroid.image(height: AppDimensions.size40),
            const SizedBox(
              height: AppDimensions.size20,
            ),
            Text(
              LocaleKeys.textExample.tr(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: AppDimensions.size20,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
