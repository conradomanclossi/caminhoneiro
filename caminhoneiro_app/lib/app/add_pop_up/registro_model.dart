import 'package:caminhoneiro_app/sqlite/suport_database.dart';
import 'package:mobx/mobx.dart';
part 'registro_model.g.dart';

class RegistroModel = _RegistroModelBase with _$RegistroModel;

abstract class _RegistroModelBase with Store {
  _RegistroModelBase({this.registro});

  @observable
  Registro registro;

  @action
  setViagem(int value) => registro.viagemId = value;

  @action
  setCategoria(int value) => registro.categoriaId = value;

  @action
  setDate(String value) => registro.date = value;

  @action
  setTitle(String value) => registro.titulo = value;

  @action
  setValue(double value) => registro.valor = value;
}
