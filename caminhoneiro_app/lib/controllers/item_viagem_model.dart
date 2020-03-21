import 'package:mobx/mobx.dart';
part 'item_viagem_model.g.dart';

class ItemModelViagem = _ItemModelViagemBase with _$ItemModelViagem;

abstract class _ItemModelViagemBase with Store {
  _ItemModelViagemBase(
      {this.idViagem, this.viagemSaida, this.viagemChegada});

  @observable
  int idViagem;

  @observable
  String viagemSaida;

  @observable
  String viagemChegada;

  @action
  setIdViagem(int value) => idViagem = value;

  @action
  setViagemSaida(String value) => viagemSaida = value;

  @action
  setViagemChegada(String value) => viagemChegada = value;
}
