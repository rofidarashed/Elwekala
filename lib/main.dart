import 'package:el_wekala/core/helper/cash_helper/cash_helper.dart';
import 'package:el_wekala/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const MyApp());
}
