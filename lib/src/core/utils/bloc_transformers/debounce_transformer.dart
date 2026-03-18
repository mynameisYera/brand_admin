import 'transformer_imports.dart';

Stream<E> debounceTransformer<E>(
  Stream<E> events,
  EventMapper<E> mapper, {
  int debounceTime = 100,
}) =>
    events
        .debounceTime(Duration(milliseconds: debounceTime))
        .switchMap((mapper));
