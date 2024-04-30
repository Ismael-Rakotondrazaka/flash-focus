import 'package:sqflite/sqflite.dart';

abstract class Migration {
  Future<void> up({
    required Database db,
    bool? force,
  });

  Future<void> down({
    required Database db,
  });
}
