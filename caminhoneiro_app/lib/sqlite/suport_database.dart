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
final String comissaoColumn = 'comissaoColumn';

/// Tabelas Registros
final String registroTable = 'registroTable';
final String viagemColumn = 'viagemColumn';
final String categoriaColumn = 'categoriaColumn';
final String dateColumn = 'dateColumn';
final String valorColumn = 'valorColumn';

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
  double comissao;

  Categoria();

  // Construtor em Map
  Categoria.fromMap(Map map) {
    id = map[idColumn];
    tipo = map[tipoCategoriaColumn];
    titulo = map[tituloColumn];
    comissao = map[comissaoColumn];
  }

  // Respondendo um map
  Map toMap() {
    Map<String, dynamic> map = {tipoCategoriaColumn: tipo, tituloColumn: titulo, comissaoColumn: comissao};
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Categoria Faturamento(id: $id, tipo: $tipo, título: $titulo, comissão: $comissao)";
  }
}

/// Modelando um registro
class Registro {
  int id;
  int viagemId;
  int categoriaId;
  String date;
  String titulo;
  double valor;

  Registro();

  // Construtor em Map
  Registro.fromMap(Map map) {
    id = map[idColumn];
    viagemId = map[viagemColumn];
    categoriaId = map[categoriaColumn];
    date = map[dateColumn];
    titulo = map[tituloColumn];
    valor = map[valorColumn];
  }

  // Respondendo um map
  Map toMap() {
    Map<String, dynamic> map = {
      viagemColumn: viagemId,
      categoriaColumn: categoriaId,
      dateColumn: date,
      tituloColumn: titulo,
      valorColumn: valor
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
  // Devolvendo uma string
  @override
  String toString() {
    return "Registro(id: $id, viagem: $viagemId, categoria: $categoriaId, data: $date, titulo: $titulo, valor: $valor)";
  }

}