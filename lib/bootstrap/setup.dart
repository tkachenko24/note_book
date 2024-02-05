import 'dart:async';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'injectable/export.dart';
import 'package:note_book/common/export.dart';

import 'modules/export.dart';

Future<void> setup() async {
  final injector = Injector(
    injectable: [
      CommonInjectable(),
      DashboardInjectable(),
    ],
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    injector.setup(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  final preferences = PreferencesBloc((PreferencesState state) async {});

  final providers = [
    BlocProvider.value(value: preferences),
  ];

  preferences.add(const Initialization());

  runApp(
    MultiProvider(
      providers: providers,
      child: Navigation(
        builder: (
          context,
          routerDelegate,
          routeInformationParser,
          routeInformationProvider,
        ) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: FlexThemeData.light(
              useMaterial3: true,
              scheme: FlexScheme.greenM3,
              background: CupertinoColors.lightBackgroundGray,
            ),
            routerDelegate: routerDelegate,
            routeInformationParser: routeInformationParser,
            routeInformationProvider: routeInformationProvider,
          );
        },
      ),
    ),
  );
}
