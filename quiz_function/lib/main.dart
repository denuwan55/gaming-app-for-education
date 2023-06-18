import 'package:flutter/material.dart';
import 'package:quiz_app/Features/Puzzle/Core/app_string.dart';
import 'package:quiz_app/Features/Puzzle/Services/hive_db.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/Widgets/game_app.dart';
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
