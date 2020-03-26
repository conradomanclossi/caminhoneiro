import 'package:caminhoneiro_app/sqlite/controller/database_controller.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:mobx/mobx.dart';

part 'home_item_controller.g.dart';

class HomeItemController = _HomeItemControllerBase with _$HomeItemController;

abstract class _HomeItemControllerBase with Store {
  _HomeItemControllerBase({this.registro, this.database});

  @observable
  Registro registro;

  @observable
  DataBase database;

  @action
  getCategoria(int id) {
    database.categorias.forEach((element) {
      if (element.id == id) {
        element;
      }
    });
  }
}
