import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

/// Colunas Padrão:
final String idColumn = 'idColumn';
final String tituloColumn = 'tituloColumn';

/// Tabela Viagem:
final String viagemTable = 'viagemTable';
final String saidaColumn = 'saidaColumn';
final String chegadaColumn = 'chegadaColumn';

/// Tabelas Categorias:
final String categoriaTable = 'categoriaTable';
final String tipoCategoriaColumn = 'tipoCategoriaColumn';

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

      /// Table Viagem
      await db.execute("""
      CREATE TABLE $viagemTable(
      $idColumn INTEGER PRIMARY KEY, 
      $saidaColumn TEXT, 
      $chegadaColumn TEXT);""");

      /// Table Categoria
      await db.execute("""
      CREATE TABLE $categoriaTable(
      $idColumn INTEGER PRIMARY KEY,
      $tipoCategoriaColumn TEXT, 
      $tituloColumn TEXT);""");
    });
  }

  /// Viagem
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
  getNumberViagem() async {
    Database dbViagem = await db;
    return Sqflite.firstIntValue(
        await dbViagem.rawQuery('SELECT COUNT(*) FROM $viagemTable'));
  }

  /// Categorias
  /// Salva uma categoria
  Future<Categoria> saveCategoria(Categoria categoria) async {
    Database dbCategoria = await db;
    categoria.id =
        await dbCategoria.insert(categoriaTable, categoria.toMap());
    return categoria;
  }

  /// Pega uma categoria
  Future<Categoria> getCategoria(int id) async {
    Database dbCategoria = await db;
    List<Map> maps = await dbCategoria.query(categoriaTable,
        columns: [idColumn, tipoCategoriaColumn, tituloColumn],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Categoria.fromMap(maps.first);
    } else {
      return null;
    }
  }

  /// Deleta uma categoria faturamento
  Future<int> deleteCategoria(int id) async {
    Database dbCategoria = await db;
    return await dbCategoria
        .delete(categoriaTable, where: '$idColumn = ?', whereArgs: [id]);
  }
  /// Atualiza uma categoria
  Future<int> updateCategoria(Categoria categoria) async {
    Database dbCategoria = await db;
    return await dbCategoria.update(categoriaTable, categoria.toMap(),
    where: '$idColumn = ?', whereArgs: [categoria.id]);
  }
  /// Pega todas as categorias
  getAllCategorias() async {
    Database dbCategoria = await db;
    List listMap = await dbCategoria.rawQuery('SELECT * FROM $categoriaTable');
    List<Categoria> listCategoria = List();
    for (Map m in listMap) {
      listCategoria.add(Categoria.fromMap(m));
    }
    return listCategoria;
  }
  /// Conta a quantidade de categorias
  getNumberCategorias() async {
    Database dbCategoria = await db;
    return Sqflite.firstIntValue(await dbCategoria.rawQuery('SELECT COUNT(*) FROM $categoriaTable'));
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

/// Modelando uma Categoria
class Categoria {
  int id;
  String tipo;
  String titulo;

  Categoria();

  // Construtor em Map
  Categoria.fromMap(Map map) {
    id = map[idColumn];
    tipo = map[tipoCategoriaColumn];
    titulo = map[tituloColumn];
  }

  // Respondendo um map
  Map toMap() {
    Map<String, dynamic> map = {tipoCategoriaColumn: tipo, tituloColumn: titulo};
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Categoria Faturamento(id: $id, tipo: $tipo, título: $titulo)";
  }
}