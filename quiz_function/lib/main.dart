import 'package:flutter/material.dart';
import 'package:quiz_app/Puzzle/Core/app_string.dart';
import 'package:quiz_app/Puzzle/Services/hive_db.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/game_app.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<ImageStore>(ImageStoreAdapter());
  await Hive.openBox<ImageStore>(AppString.dbName);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const GameApp()));
  // runApp(const GameApp());
}
