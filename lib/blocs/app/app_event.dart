part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppUserChanged extends AppEvent {
  const AppUserChanged({required this.user});
  final User? user;

  @override
  List<Object?> get props => [user];
}

class AppLogoutRequested extends AppEvent {}

class AppSignupLoading extends AppEvent {}

class AppSignupRequested extends AppEvent {
  const AppSignupRequested(this.user);
  final User? user;

  @override
  List<Object?> get props => [user];
}
