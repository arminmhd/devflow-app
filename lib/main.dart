import 'package:devflow/app/app.dart';
import 'package:devflow/app/di/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.init();

  runApp(const DevFlowApp());
}
