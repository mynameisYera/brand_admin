part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginEvent({
    required String username,
    required String password,
    required VoidCallback onSuccess,
  }) = _LoginEvent;
}