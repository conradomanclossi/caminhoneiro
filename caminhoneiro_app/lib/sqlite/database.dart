import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'suport_database.dart';

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
      $saidaColumn DATE, 
      $chegadaColumn DATE);""");

      /// Table Categoria
      await db.execute("""
      CREATE TABLE $categoriaTable(
      $idColumn INTEGER PRIMARY KEY,
      $tipoCategoriaColumn TEXT, 
      $tituloColumn TEXT
      $comissaoColumn FLOAT);""");

      /// Table Registro
      await db.execute("""
      CREATE TABLE $registroTable(
      $idColumn INTEGER PRIMARY KEY,
      $viagemColumn INTEGER,
      $categoriaColumn INTEGER,
      $dateColumn DATE,
      $tituloColumn TEXT,
      $valorColumn FLOAT,
      FOREIGN KEY ($viagemColumn) REFERENCES $viagemTable($idColumn),
      FOREIGN KEY ($categoriaColumn) REFERENCES $categoriaTable($idColumn)
      );""");
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
    categoria.id = await dbCategoria.insert(categoriaTable, categoria.toMap());
    return categoria;
  }

  /// Pega uma categoria
  Future<Categoria> getCategoria(int id) async {
    Database dbCategoria = await db;
    List<Map> maps = await dbCategoria.query(categoriaTable,
        columns: [idColumn, tipoCategoriaColumn, tituloColumn, comissaoColumn],
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
    return Sqflite.firstIntValue(
        await dbCategoria.rawQuery('SELECT COUNT(*) FROM $categoriaTable'));
  }

  /// Registro
  /// Salva um registro
  Future<Registro> saveRegistro(Registro registro) async {
    Database dbRegistro = await db;
    registro.id = await dbRegistro.insert(registroTable, registro.toMap());
    return registro;
  }

  /// Pega um registro
  Future<Registro> getRegistro(int id) async {
    Database dbRegistro = await db;
    List<Map> maps = await dbRegistro.query(registroTable,
        columns: [
          idColumn,
          viagemColumn,
          categoriaColumn,
          dateColumn,
          tituloColumn,
          valorColumn
        ],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Registro.fromMap(maps.first);
    } else {
      return null;
    }
  }

  /// Detela um registro
  Future<int> deleteRegistro(int id) async {
    Database dbRegistro = await db;
    return await dbRegistro
        .delete(registroTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  /// Atualiza um registro
  Future<int> updateRegistro(Registro registro) async {
    Database dbRegistro = await db;
    return await dbRegistro.update(registroTable, registro.toMap(),
    where: '$idColumn = ?', whereArgs: [registro.id]);
  }

  /// Pega todos os registros
  getAllRegistros() async {
    Database dbRegistro = await db;
    List listMap = await dbRegistro.rawQuery('SELECT * FROM $registroTable');
    List<Registro> listRegistro = List();
    for (Map m in listMap) {
      listRegistro.add(Registro.fromMap(m));
    }
    return listRegistro;
  }

  /// Conta a quantidade de registros
  getNumberRegistro() async {
    Database dbRegistro = await db;
    return Sqflite.firstIntValue(await dbRegistro.rawQuery('SELECT COUNT(*) FROM $registroTable'));
  }

  /// Fecha o banco de dados
  Future closse() async {
    Database dbViagem = await db;
    dbViagem.close();
  }
}
