import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

/// Colunas Padrão:
final String idColumn = 'idColumn';

/// Tabela Viagem:
final String viagemTable = 'viagemTable';
final String saidaColumn = 'saidaColumn';
final String chegadaColumn = 'chegadaColumn';

/// Database
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'database.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("""
      CREATE TABLE $viagemTable(
      $idColumn INTEGER PRIMARY KEY, 
      $saidaColumn TEXT, 
      $chegadaColumn TEXT);""");
    });
  }

  /// Salva uma viagem
  Future<Viagem> saveViagem(Viagem viagem) async {
    Database dbViagem = await db;
    viagem.id = await dbViagem.insert(viagemTable, viagem.toMap());
    return viagem;
  }

  /// Pega um contato
  Future<Viagem> getViagem(int id) async {
    Database dbViagem = await db;
    List<Map> maps = await dbViagem.query(viagemTable,
        columns: [idColumn, saidaColumn, chegadaColumn],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Viagem.fromMap(maps.first);
    } else {
      return null;
    }
  }

  /// Deleta uma viagem
  Future<int> deleteViagem(int id) async {
    Database dbViagem = await db;
    return await dbViagem
        .delete(viagemTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  /// Atualiza uma viagem
  Future<int> updateViagem(Viagem viagem) async {
    Database dbViagem = await db;
    return await dbViagem.update(viagemTable, viagem.toMap(),
        where: '$idColumn = ?', whereArgs: [viagem.id]);
  }

  /// Pega todas as viagens
  getAllViagens() async {
    Database dbViagem = await db;
    List listMap = await dbViagem.rawQuery('SELECT * FROM $viagemTable');
    List<Viagem> listViagem = List();
    for (Map m in listMap) {
      listViagem.add(Viagem.fromMap(m));
    }
    return listViagem;
  }

  /// Conta a quantidade de viagens
  getNumber() async {
    Database dbViagem = await db;
    return Sqflite.firstIntValue(
        await dbViagem.rawQuery('SELECT COUNT(*) FROM $viagemTable'));
  }

  /// Fecha o banco de dados
  Future closse() async {
    Database dbViagem = await db;
    dbViagem.close();
  }
}

/// Modelando uma viagem
class Viagem {
  int id;
  String saida;
  String chegada;

  Viagem();

  // Construtor em Map
  Viagem.fromMap(Map map) {
    id = map[idColumn];
    saida = map[saidaColumn];
    chegada = map[chegadaColumn];
  }

  // Respondendo um map
  Map toMap() {
    Map<String, dynamic> map = {saidaColumn: saida, chegadaColumn: chegada};
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  // Devolvendo uma string
  @override
  String toString() {
    return "Viagem(id: $id, saida: $saida, chegada: $chegada)";
  }
}
