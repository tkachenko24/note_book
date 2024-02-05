// ignore_for_file: implicit_call_tearoffs

import 'package:go_router/go_router.dart';

import 'package:note_book/common/export.dart';

import 'guards/export.dart';
import 'screens/export.dart';
import 'notifiers/export.dart';

typedef RoutingBuilder = Widget Function(
  BuildContext context,
  RouterDelegate<Object> routerDelegate,
  RouteInformationParser<Object> routeInformationParser,
  RouteInformationProvider routeInformationProvider,
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation extends StatelessWidget {
  final RoutingBuilder builder;
  final List<Screens> screens = [
    CommonScreens(),
    DashboardScreens(),
  ];

  Navigation({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      initialLocation: CommonScreens.splash.path,
      refreshListenable: Listenable.merge([
        BlocNotifier(context.read<PreferencesBloc>()),
      ]),
      redirect: ScreenGuards([
        BootstrapGuard(),
      ]),
      routes: screens.expand((screen) => screen.routes).toList(),
      errorBuilder: (context, state) => const UnknownScreen(),
    );

    return builder(
      context,
      router.routerDelegate,
      router.routeInformationParser,
      router.routeInformationProvider,
    );
  }
}
