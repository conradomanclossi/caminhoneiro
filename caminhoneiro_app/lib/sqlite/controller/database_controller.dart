// Packages
import 'package:mobx/mobx.dart';
// DataBase
import '../database.dart';
import '../suport_database.dart';
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

  @action
  Future<void> loadDataBase() async {
    loadViagens();
    loadCategorias();
    loadRegistros();
  }

  // Viagem Action
  @action
  saveViagem(Viagem value) {
    helper.saveViagem(value);
    loadDataBase();
  }

  @action
  updateViagem(Viagem value) {
    helper.updateViagem(value);
    loadDataBase();
  }

  @action
  deleteViagem(int id) {
    helper.deleteViagem(id);
    loadDataBase();
  }

  @action
  getViagem(int id) {
    Viagem _item;
    viagens.forEach((element) {
      if (element.id == id) {
        _item = element;
      }
    });
    return _item;
  }

  // Categoria Action
  @action
  saveCategoria(Categoria value) {
    helper.saveCategoria(value);
    loadDataBase();
  }

  @action
  updateCategoria(Categoria value) {
    helper.updateCategoria(value);
    loadDataBase();
  }

  @action
  deleteCategoria(int id) {
    helper.deleteCategoria(id);
    loadDataBase();
  }

  @action
  getCategoria(int id) {
    Categoria _item;
    categorias.forEach((element) {
      if (element.id == id) {
        _item = element;
      }
    });
    return _item;
  }

  // Registro Action
  @action
  saveRegistro(Registro value) {
    helper.saveRegistro(value);
    loadDataBase();
  }

  @action
  updateRegistro(Registro value) {
    helper.updateRegistro(value);
    loadDataBase();
  }

  @action
  deleteRegistro(int id) {
    helper.deleteRegistro(id);
    loadDataBase();
  }

  @action
  getRegistro(int id) {
    Registro _item;
    registros.forEach((element) {
      if (element.id == id) {
        _item = element;
      }
    });
    return _item;
  }
}
