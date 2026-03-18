import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:brand_admin/src/core/base/base_bloc/context/context_activity_bloc.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:brand_admin/src/features/auth/domain/request/login_request.dart';
import 'package:brand_admin/src/features/auth/domain/usecases/login_admin_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';


class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._loginAdminUseCase) : super(AuthState.initial(), ContextActivityBloc());
  final LoginAdminUseCase _loginAdminUseCase;

  @override
  Future<void> onEventHandler(AuthEvent event, Emitter emit) async {
    await event.when(
      loginEvent: (username, password, onSuccess) => _login(event as _LoginEvent, emit),
    );
  }

  Future<void> _login(AuthEvent event, Emitter emit) async {
    try {
      emit(AuthState.loading());
      final request = LoginRequest(phone: event.username, password: event.password);
      final result = await _loginAdminUseCase.call(request);
      
      if (result.isSuccessful) {
        
        await FlutterSecureStorageWeb().setToken(result.data?.access ?? '');
        await FlutterSecureStorageWeb().setRefresh(result.data?.refresh ?? '');
        emit(AuthState.success('Успешный вход'));
        
        await Future.delayed(const Duration(milliseconds: 100));
        event.onSuccess();
      } else {
        String errorMessage = 'Произошла ошибка при входе';
        if (result.failure != null) {
          errorMessage = result.failure!.message;
        }
        emit(AuthState.loadingError(errorMessage));
      }
    } catch (e) {
      final errorMessage = e.toString().isNotEmpty ? e.toString() : 'Произошла неизвестная ошибка';
      emit(AuthState.loadingError(errorMessage));
    }
  }
}
