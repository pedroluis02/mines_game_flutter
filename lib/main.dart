import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'app.dart';

Logger _log = Logger('main.dart');

void main() {
  _setup();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

void _setup() {
  _setupLogger();
  _setupFullScreenMode();
}

void _setupLogger() {
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
}

void _setupFullScreenMode() {
  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
}
