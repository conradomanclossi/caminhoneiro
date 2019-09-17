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

/// Modelos
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