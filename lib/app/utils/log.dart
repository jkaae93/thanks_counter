import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  static void e(dynamic m) {
    _logger.e(m);
  }

  static void d(dynamic m) {
    _logger.d(m);
  }

  static void i(dynamic m) {
    _logger.i(m);
  }

  static void w(dynamic m) {
    _logger.w(m);
  }
}
