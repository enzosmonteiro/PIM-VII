
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Database? _db;
  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await openDatabase(
      join(await getDatabasesPath(), 'conectalar.db'),
      version: 1,
      onCreate: (db, v) async {
        await db.execute('CREATE TABLE servicos(id INTEGER PRIMARY KEY, nome TEXT, descricao TEXT, preco REAL)');
        await db.execute('CREATE TABLE agendamentos(id INTEGER PRIMARY KEY, servicoId INTEGER, dataHora TEXT, endereco TEXT, status TEXT, sincronizado INTEGER)');
      },
    );
    return _db!;
  }
}
