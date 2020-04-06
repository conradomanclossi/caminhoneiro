import 'package:mobx/mobx.dart';
import '../suport_database.dart';

part 'viagem_controller.g.dart';

class ViagemController = _ViagemControllerBase with _$ViagemController;

abstract class _ViagemControllerBase with Store {

  @observable
  Viagem viagem;

  @action
  setSaida(String value) => viagem.saida = value;

  @action
  setChegada(String value) => viagem.chegada = value;

  @computed
  bool get viagemIsTrue => viagem.chegada != null && viagem.saida != null;
}
