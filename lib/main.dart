import 'package:device_preview/device_preview.dart';
import 'package:el_wekala/core/helper/cash_helper/cash_helper.dart';
import 'package:el_wekala/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}
