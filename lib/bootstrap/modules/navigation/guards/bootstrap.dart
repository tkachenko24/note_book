import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:note_book/common/export.dart';

import 'guard.dart';
import '../screens/export.dart';

class BootstrapGuard implements ScreenGuard {
  @override
  FutureOr<String?> call(BuildContext context, GoRouterState state) {
    final preferences = context.read<PreferencesBloc>();
    final isFinish = preferences.state.isFinish();
    final isSplash = state.matchedLocation == CommonScreens.splash.path;
    if (isSplash && isFinish) {
      return DashboardScreens.dashboard.path;
    }
    return null;
  }
}
