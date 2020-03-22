import 'package:caminhoneiro_app/sqlite/database.dart';
import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

DatabaseHelper helper = DatabaseHelper();

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  /* @observable
  ObservableList<ItemModel> listItem = [
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false)
  ].asObservable(); */

  @observable
  ObservableList<Viagem> viagens = List();

  /* @computed
  int get totalChecked => listItem.where((item) => item.check).length; */

  @action
  Future<void> loadDataBase() async {
    await helper.getAllViagens().then((list) {
      viagens = list;
    });
  }

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

@observable
  String filter = "";

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Viagem> get viagemFiltered {
    if (filter.isEmpty) {
      return viagens;
    } else {
      return viagens.where((item) => item.saida.contains(filter.toLowerCase())).toList();
    }
  }

/*   @action
  Future<void> loadDataBase() async {
    loading = true; //This notifies observers
    stuff = await fetchStuff();
    loading = false; //This also notifies observers
  } */

  /* @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return listItem;
    } else {
      return listItem.where((item) => item.title.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  } */

  

  /* @action
  addItem(ItemModel model) {
    listItem.add(model);
  } */

  /* @action
  removeItem(ItemModel model) {
    listItem.removeWhere((item) => item.title == model.title);
  } */
}
