// This example shows how to use redirect to handle a sign-in flow.
// The GoRouter.redirect method is called before the app is navigate to a
// new page. You can choose to redirect to a different page by returning a
// non-null URL string.

import 'dart:async';

import 'package:beegains/blocs/blocs.dart';
import 'package:beegains/screens/cart_screen.dart';
import 'package:beegains/screens/home_screen.dart';
import 'package:beegains/screens/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter(this.appBloc);
  final AppBloc appBloc;
  static const homeRoute = '/';
  static const loginRoute = '/login';
  static const cartRoute = '/cart';

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
            name: 'cart',
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
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
      final isLoginScreen = state.location == '/login';
      if (!loggedIn && !isLoginScreen) {
        return '/login';
      } else if (loggedIn && isLoginScreen) {
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
