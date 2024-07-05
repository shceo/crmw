// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart' as logger;

abstract final class CoreLogger {
  static final _loggerInstance = logger.Logger();

  static void infoLog(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    _loggerInstance.i('''
      $logMessage 
      
      ${params == null ? '' : 'Info Params:'}
      ${params ?? ''}
    ''');
  }

  static void errorLog(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    _loggerInstance.e('''
      $logMessage 
      
      ${params == null ? '' : 'Error Params:'}
      ${params ?? ''}
    ''');
  }

  static void warningLog(
    String logMessage, {
    Map<String, dynamic>? params,
  }) {
    _loggerInstance.w('''
      $logMessage 
      
      ${params == null ? '' : 'Error Params:'}
      ${params ?? ''}
    ''');
  }
}
