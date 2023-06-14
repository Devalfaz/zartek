part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated, loginLoading }

class AppState extends Equatable {
  const AppState._({required this.status});
  const AppState.authenticated() : this._(status: AppStatus.authenticated);
  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.loginLoading() : this._(status: AppStatus.loginLoading);
  final AppStatus status;

  @override
  List<Object?> get props => [status];
}
