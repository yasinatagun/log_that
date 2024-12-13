import 'dart:developer' as developer;

class LogThat {
  // ANSI color codes
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _magenta = '\x1B[35m';
  static const String _cyan = '\x1B[36m';

  /// Logs an informational message (green).
  static void info(String message, {String? subject, Object? value, String tag = 'INFO'}) {
    _printLog(message, color: _green, tag: tag, subject: subject, value: value);
  }

  /// Logs a warning message (yellow).
  static void warning(String message, {String? subject, Object? value, String tag = 'WARNING'}) {
    _printLog(message, color: _yellow, tag: tag, subject: subject, value: value);
  }

  /// Logs an error message (red).
  static void error(String message, {String? subject, Object? value, String tag = 'ERROR'}) {
    _printLog(message, color: _red, tag: tag, subject: subject, value: value);
  }

  /// Logs a debug message (cyan).
  static void debug(String message, {String? subject, Object? value, String tag = 'DEBUG'}) {
    _printLog(message, color: _cyan, tag: tag, subject: subject, value: value);
  }

  /// Logs a verbose message (blue).
  static void verbose(String message, {String? subject, Object? value, String tag = 'VERBOSE'}) {
    _printLog(message, color: _blue, tag: tag, subject: subject, value: value);
  }

  /// Logs a special message (magenta).
  static void special(String message, {String? subject, Object? value, String tag = 'SPECIAL'}) {
    _printLog(message, color: _magenta, tag: tag, subject: subject, value: value);
  }

  static void _printLog(
    String message, {
    required String color,
    required String tag,
    String? subject,
    Object? value,
  }) {
    final buffer = StringBuffer('$color[$tag] $message');

    if (subject != null) {
      buffer.write(' | subject: $subject');
    }
    if (value != null) {
      buffer.write(' | value: $value');
    }

    buffer.write(_reset);

    developer.log(buffer.toString(), name: tag);
  }
}
