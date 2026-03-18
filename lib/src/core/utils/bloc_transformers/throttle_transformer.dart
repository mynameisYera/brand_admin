import 'transformer_imports.dart';

Stream<E> throttleTransformer<E>(
  Stream<E> events,
  EventMapper<E> mapper, {
  int throttleTime = 100,
}) =>
    events
        .throttleTime(Duration(milliseconds: throttleTime))
        .switchMap((mapper));
