import 'dart:async';

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart';

extension on DateTime {
  /// Transforms DateTime to String with format: 00:00:00
  String get formatted =>
      <int>[hour, minute, second].map(Log._timeFormat).join(':');
}

extension on LogLevel {
  /// Emoji for each log level
  String get emoji => maybeWhen(
        shout: () => '❗️',
        error: () => '🚫',
        warning: () => '⚠️',
        info: () => '💡',
        debug: () => '🐞',
        orElse: () => '📌',
      );
}

mixin Log {
  /// How much digits there should be in the time
  static const int _timeLength = 2;

  /// Log options for the [L] library
  static const LogOptions _logOptions = LogOptions(
    printColors: true,
    outputInRelease: false,
    messageFormatting: _formatLoggerMessage,
  );

  /// Formats the time to have [_timeLength] digits
  static String _timeFormat(int input) =>
      input.toString().padLeft(_timeLength, '0');

  /// Formats the message for the [L] library
  static String _formatLoggerMessage(
    Object message,
    LogLevel logLevel,
    DateTime now,
  ) =>
      '${logLevel.emoji} ${now.formatted} | $message';

  /// Formats the error message for the [L] library
  ///
  /// If [stackTrace] is null then we get the stack trace from the
  /// [StackTrace.current].
  ///
  /// Builds error through [StringBuffer] and returns it.
  static String _formatError(
    String type,
    String error,
    StackTrace? stackTrace,
  ) {
    final StackTrace trace = stackTrace ?? StackTrace.current;

    final StringBuffer buffer = StringBuffer(type)
      ..write(' error: ')
      ..writeln(error)
      ..writeln('Stack trace:')
      ..write(Trace.from(trace).terse);

    return buffer.toString();
  }

  /// Helper static method to log a zone error
  ///
  /// later, it would be send to the sentry
  static void logZoneError(
    Object? e,
    StackTrace st,
  ) {
    l.e(_formatError('Top-level', e.toString(), st), st);
    Sentry.captureException(e, stackTrace: st).ignore();
  }

  /// Helper static method to log a flutter error [FlutterError.onError]
  /// like widget overflow, etc.
  ///
  /// it isn't sent to the sentry
  ///
  ///
  static void logFlutterError(
    FlutterErrorDetails details,
  ) {
    final StackTrace? stack = details.stack;
    l.e(_formatError('Flutter', details.exceptionAsString(), stack), stack);
  }

  /// run in a zone
  static T runLogging<T>(T Function() body) => l.capture(body, _logOptions);

  static void s(Object message, {String? name}) {
    l.s(getFormattedMessage(name, message));
  }

  static void v(Object message, {String? name}) {
    l.v(getFormattedMessage(name, message));
  }

  static void v1(Object message, {String? name}) {
    l.v1(getFormattedMessage(name, message));
  }

  static void vv(Object message, {String? name}) {
    l.vv(getFormattedMessage(name, message));
  }

  static void v2(Object message, {String? name}) {
    l.v2(getFormattedMessage(name, message));
  }

  static void vvv(Object message, {String? name}) {
    l.vvv(getFormattedMessage(name, message));
  }

  static void v3(Object message, {String? name}) {
    l.v3(getFormattedMessage(name, message));
  }

  static void vvvv(Object message, {String? name}) {
    l.vvvv(getFormattedMessage(name, message));
  }

  static void v4(Object message, {String? name}) {
    l.v4(getFormattedMessage(name, message));
  }

  static void vvvvv(Object message, {String? name}) {
    l.vvvvv(getFormattedMessage(name, message));
  }

  static void v5(Object message, {String? name}) {
    l.v5(getFormattedMessage(name, message));
  }

  static void vvvvvv(Object message, {String? name}) {
    l.vvvvvv(getFormattedMessage(name, message));
  }

  static void v6(Object message, {String? name}) {
    l.v6(getFormattedMessage(name, message));
  }

  static void i(Object message, {String? name}) {
    l.i(getFormattedMessage(name, message));
  }

  static void w(Object message, {String? name}) {
    l.w(getFormattedMessage(name, message));
  }

  static void e(
    Object message, {
    String? name,
    StackTrace? stackTrace,
  }) {
    l.e(getFormattedMessage(name, message), stackTrace);
  }

  static void d(Object message, {String? name}) {
    l.d(getFormattedMessage(name, message));
  }

  static Object getFormattedMessage(String? name, Object message) =>
      name != null ? '[$name] $message' : message;
}
