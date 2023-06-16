import 'package:beegains/blocs/app/app_bloc.dart';
import 'package:beegains/blocs/cart/cart_bloc.dart';
import 'package:beegains/config/routes.dart';
import 'package:beegains/cubits/cubits.dart';
import 'package:beegains/l10n/l10n.dart';
import 'package:beegains/repositories/api.dart';
import 'package:beegains/repositories/repositories.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => API()),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => RestaurantRepository(
            api: context.read<API>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => InternetCubit(
              connectivity: Connectivity(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter(context.read<AppBloc>()).router,
      title: 'Zartek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        useMaterial3: false,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
