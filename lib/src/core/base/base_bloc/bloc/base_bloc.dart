import 'package:flutter_bloc/flutter_bloc.dart';
import '../context/context_activity_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  final ContextActivityBloc contextActivityBloc;

  BaseBloc(super.initialState, this.contextActivityBloc) {
    on<E>((event, emit) async {
      if (!isClosed) {
        try {
          await onEventHandler(event, emit);
        } catch (error, stackTrace) {
          onError(error, stackTrace);
          rethrow;
        }
      }
    });
  }

  Future<void> onEventHandler(E event, Emitter<S> emit);

  Future<void> withContextHandler(Future<void> Function() handler) async {
    if (!isClosed) {
      try {
        contextActivityBloc.add(ContextActivityEvent.handleContextActivity((context) {
          // Loading state - the widget will handle showing loading indicator
        }));
        await handler();
        contextActivityBloc.add(ContextActivityEvent.handleContextActivity((context) {
          // Idle state - the widget will handle hiding loading indicator
        }));
      } catch (e) {
        contextActivityBloc.add(ContextActivityEvent.handleContextActivity((context) {
          // Error state - the widget will handle hiding loading indicator
        }));
        rethrow;
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (!isClosed) {
      contextActivityBloc.add(ContextActivityEvent.handleContextActivity((context) {
        // Error state - the widget will handle hiding loading indicator
      }));
    }
    super.onError(error, stackTrace);
  }
}
