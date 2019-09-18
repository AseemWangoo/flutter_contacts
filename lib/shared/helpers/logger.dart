import 'package:logger/logger.dart';

///Log the Application logs...
Logger appLogs(String className) => Logger(
      printer: _AppLogger(className),
    );

class _AppLogger extends LogPrinter {
  //

  ///Specify the class name to log...
  ///This will be shown in the log....
  final String className;

  _AppLogger(
    this.className,
  );

  @override
  void log(LogEvent event) {
    final String _emoji = PrettyPrinter.levelEmojis[event.level];

    println('$_emoji>> $className - ${event.message}');
  }
}
