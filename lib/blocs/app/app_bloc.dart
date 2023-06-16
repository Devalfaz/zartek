import 'dart:async';

// import 'package:beegains/models/models.dart';
import 'package:beegains/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser != null
              ? const AppState.authenticated()
              : const AppState.unauthenticated(),
        ) {
    // When the user logins emit AppsState.authenticated
    _userSubscription = _authRepository.user.listen(
      (user) => add(AppUserChanged(user: user)),
    );
    on<AppUserChanged>(_onUserChanged);
    on<AppSignupRequested>(_onSignupRequest);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppSignupLoading>(
      (event, emit) => emit(const AppState.loginLoading()),
    );
  }
  //Getter for AuthRepository user
  Stream<User?> get user => _authRepository.user;

  final AuthRepository _authRepository;
  StreamSubscription<User?>? _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user != null
          ? const AppState.authenticated()
          : const AppState.unauthenticated(),
    );
  }

  void _onSignupRequest(AppSignupRequested event, Emitter<AppState> emit) {
    emit(const AppState.loginLoading());
    _authRepository.loginWithGoogle();
    emit(
      event.user != null
          ? const AppState.authenticated()
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    emit(const AppState.unauthenticated());
    unawaited(_authRepository.logout());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
