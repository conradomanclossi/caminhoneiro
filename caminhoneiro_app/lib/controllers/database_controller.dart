import 'package:caminhoneiro_app/controllers/item_viagem_model.dart';
import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:mobx/mobx.dart';
part 'database_controller.g.dart';

DatabaseHelper helper = DatabaseHelper();

class DataBase = _DataBaseBase with _$DataBase;

abstract class _DataBaseBase with Store {
  @observable
  ObservableList<ItemModelViagem> viagens = [
    ItemModelViagem(
        idViagem: 1, viagemSaida: "Saida 01", viagemChegada: "Chegada 01"),
    ItemModelViagem(
        idViagem: 2, viagemSaida: "Saida 02", viagemChegada: "Chegada 02"),
    ItemModelViagem(
        idViagem: 3, viagemSaida: "Saida 03", viagemChegada: "Chegada 03"),
  ].asObservable();

  /* @action
  setViagens()  {
    helper.getAllViagens().then((list) async {
      viagens = list;
    });
  } */
}
