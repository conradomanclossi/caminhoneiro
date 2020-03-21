// Packages
import 'package:mobx/mobx.dart';
// DataBase
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
// MobX Part
part 'database_controller.g.dart';

DatabaseHelper helper = DatabaseHelper();

class DataBase = _DataBaseBase with _$DataBase;

abstract class _DataBaseBase with Store {
  @observable
  List<Viagem> viagens = List();

  @observable
  List<Categoria> categorias = List();

  @observable
  List<Registro> registros = List();

  @action
  Future<void> loadDataBase() async {
    await helper.getAllViagens().then((list) {
      viagens = list;
    });
    await helper.getAllCategorias().then((list) {
      categorias = list;
    });
    await helper.getAllRegistros().then((list) {
      registros = list;
    });
  }

  @action
  Future<void> loadViagens() async {
    await helper.getAllViagens().then((list) {
      viagens = list;
    });
  }

  @action
  Future<void> loadCategorias() async {
    await helper.getAllCategorias().then((list) {
      categorias = list;
    });
  }

  @action
  Future<void> loadRegistros() async {
    await helper.getAllRegistros().then((list) {
      registros = list;
    });
  }

  // Viagem Action
  @action 
  saveViagem(Viagem value) {
    helper.saveViagem(value);
    loadViagens();
  }

  @action
  updateViagem(Viagem value) {
    helper.updateViagem(value);
    loadViagens();
  }

  @action
  deleteViagem(int id) {
    helper.deleteViagem(id);
    loadViagens();
  }

  // Categoria Action
  @action 
  saveCategoria(Categoria value) {
    helper.saveCategoria(value);
    loadCategorias();
  }

  @action
  updateCategoria(Categoria value) {
    helper.updateCategoria(value);
    loadCategorias();
  }

  @action
  deleteCategoria(int id) {
    helper.deleteCategoria(id);
    loadCategorias();
  }

  // Registro Action
  @action 
  saveRegistro(Registro value) {
    helper.saveRegistro(value);
    loadRegistros();
  }

  @action
  updateRegistro(Registro value) {
    helper.updateRegistro(value);
    loadRegistros();
  }

  @action
  deleteRegistro(int id) {
    helper.deleteRegistro(id);
    loadRegistros();
  }
}
