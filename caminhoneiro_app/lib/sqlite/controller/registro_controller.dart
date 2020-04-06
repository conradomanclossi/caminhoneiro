import 'package:mobx/mobx.dart';
import '../suport_database.dart';

part 'registro_controller.g.dart';

class RegistroController = _RegistroControllerBase with _$RegistroController;

abstract class _RegistroControllerBase with Store {
  @observable
  Registro registro;

  @action
  setViagemId(int value) => registro.viagemId = value;

  @action
  setCategoriaId(int value) => registro.categoriaId = value;

  @action
  setDate(String value) => registro.date = value;

  @action
  setTitle(String value) => registro.titulo = value;

  @action
  setValue(double value) => registro.valor = value;

  @computed
  bool get registroIsTrue =>
      registro.viagemId != null &&
      registro.categoriaId != null &&
      registro.date != null &&
      registro.titulo != null &&
      registro.valor != null;
}
