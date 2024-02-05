// ignore_for_file: implicit_call_tearoffs

import 'package:go_router/go_router.dart';
import 'package:note_book/bootstrap/injectable/export.dart';
import 'package:note_book/common/export.dart';
import 'package:note_book/dashboard/export.dart';
import 'package:note_book/dashboard/presentation/screens/detail_note/export.dart';

import '../guards/export.dart';
import 'screens.dart';

class DashboardScreens extends Screens {
  static Screen dashboard = Screen(path: '/dashboard');

  static Screen add = Screen(path: '$dashboard/add');
  static Screen detail = Screen(path: '$dashboard/detail');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: dashboard.path,
      name: dashboard.name,
      redirect: ScreenGuards([BootstrapGuard()]),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return BlocProvider(
          create: (context) => NotesBloc(repo: locator.get()),
          child: DashboardScreen(
            addNote: () => context.pushNamed(add.name),
            toDetail: (
              index,
            ) =>
                context.pushNamed(
              detail.name,
              extra: index,
            ),
            theme: Theme.of(context),
          ),
        );
      },
    ),
    GoRoute(
      path: add.path,
      name: add.name,
      redirect: ScreenGuards([BootstrapGuard()]),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return BlocProvider(
          create: (context) => NotesBloc(repo: locator.get()),
          child: NewNoteScreen(
            toDashboard: () => context.goNamed(dashboard.name),
            onSuccessSave: () => context.goNamed(dashboard.name),
            theme: Theme.of(context),
          ),
        );
      },
    ),
    GoRoute(
      path: detail.path,
      name: detail.name,
      redirect: ScreenGuards([BootstrapGuard()]),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return BlocProvider(
          create: (context) => NotesBloc(repo: locator.get()),
          child: DetailNoteScreen(
            index: state.extra as int,
            back: () => context.goNamed(dashboard.name),
            theme: Theme.of(context),
          ),
        );
      },
    ),
  ];
}
