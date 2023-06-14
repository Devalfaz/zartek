// This example shows how to use redirect to handle a sign-in flow.
// The GoRouter.redirect method is called before the app is navigate to a
// new page. You can choose to redirect to a different page by returning a
// non-null URL string.

import 'dart:async';

import 'package:beegains/blocs/blocs.dart';
import 'package:beegains/screens/home_screen.dart';
import 'package:beegains/screens/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter(this.appBloc);
  final AppBloc appBloc;

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            name: 'product_list',
            path: 'product_list/:category',
            builder: (BuildContext context, GoRouterState state) {
              // return ProductListScreen(
              //   category: state.params['category']!,
              //   asc: state.queryParams['sort'] == 'asc',
              //   quantity: int.parse(state.queryParams['filter'] ?? '0'),
              // );
              return const Placeholder();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = appBloc.state.status == AppStatus.authenticated;
      final loggingIn = state.matchedLocation == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
  );
}

// https://github.com/flutter/flutter/issues/108128
// https://github.com/csells/go_router/discussions/122
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
