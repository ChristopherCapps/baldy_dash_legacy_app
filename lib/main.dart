import 'package:flutter/material.dart';

import 'app.dart';
import 'service/service_registry.dart'; // NEW

void main() async {
  await ServiceRegistry.bootstrap();
  print('Loaded settings: ${ServiceRegistry.I.settings.uuid}');

  return runApp(const BaldyDashApp());
}
