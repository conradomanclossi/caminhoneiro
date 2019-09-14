import 'package:sqflite/sqflite.dart';

/// Colunas Viagem
final String idColumn = 'idColumn';
final String saidaColumn = 'saidaColumn';
final String chegadaColumn = 'chegadaColumn';

class ViagemHelper {
  static final ViagemHelper _instance = ViagemHelper.internal();

  factory ViagemHelper() => _instance;

  ViagemHelper.internal();

  Database _db;
}

/// Modelando uma viagem
class Viagem {
  int id;
  String saida;
  String chegada;

  // Construtor
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
    return "Viagem(saida: $saida, chegada: $chegada)";
  }
}
