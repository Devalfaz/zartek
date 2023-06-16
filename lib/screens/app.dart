import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zartek/blocs/blocs.dart';
import 'package:zartek/config/routes.dart';
import 'package:zartek/cubits/cubits.dart';
import 'package:zartek/l10n/l10n.dart';
import 'package:zartek/repositories/repositories.dart';

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
          BlocProvider(create: (context) => ThemeCubit())
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
      //Set theme using ThemeCubit
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
