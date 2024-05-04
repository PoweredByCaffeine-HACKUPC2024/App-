import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get Database async {
    if (_database != null) return _database!;
    _database = await _initialize();
    return _database!;
  }
}

class _initialize {
}