import 'package:flash_focus/src/core/exception/database_already_opened_exception.dart';
import 'package:flash_focus/src/core/exception/database_not_opened_yet_exception.dart';
import 'package:flash_focus/src/core/exception/file_system_rw_exception.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/migrations/create_attempt_table.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/migrations/create_card_table.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/migrations/create_category_table.dart';
import 'package:flash_focus/src/data/infrastructure/persistance/sqlite/util/migration.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show MissingPlatformDirectoryException, getApplicationDocumentsDirectory;
import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  Database? _database;
  final String _dbDirectory;
  final String _dbName;

  SQLiteDatabase({
    required String dbDirectory,
    required String dbName,
  })  : _dbDirectory = dbDirectory,
        _dbName = dbName;

  Database getDatabase() {
    if (_database == null) {
      throw const DatabaseNotOpenedYetException();
    }

    return _database!;
  }

  // Method to open and retrieve the existing database
  Future<Database> open() async {
    if (_database != null) {
      throw const DatabaseAlreadyOpenedException();
    }

    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, _dbDirectory, _dbName);

      final db = await openDatabase(dbPath);
      _database = db;

      final createCategoryTable = CreateCategoryTable();
      final createCardTable = CreateCardTable();
      final createAttemptTable = CreateAttemptTable();

      await Future.forEach(
        [
          createCategoryTable,
          createCardTable,
          createAttemptTable,
        ],
        (Migration migration) => migration.up(
          db: _database!,
        ),
      );

      return _database!;
    } on MissingPlatformDirectoryException {
      throw const FileSystemRWException();
    }
  }
}
