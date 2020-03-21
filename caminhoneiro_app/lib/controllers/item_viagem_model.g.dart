// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_viagem_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModelViagem on _ItemModelViagemBase, Store {
  final _$idViagemAtom = Atom(name: '_ItemModelViagemBase.idViagem');

  @override
  int get idViagem {
    _$idViagemAtom.context.enforceReadPolicy(_$idViagemAtom);
    _$idViagemAtom.reportObserved();
    return super.idViagem;
  }

  @override
  set idViagem(int value) {
    _$idViagemAtom.context.conditionallyRunInAction(() {
      super.idViagem = value;
      _$idViagemAtom.reportChanged();
    }, _$idViagemAtom, name: '${_$idViagemAtom.name}_set');
  }

  final _$viagemSaidaAtom = Atom(name: '_ItemModelViagemBase.viagemSaida');

  @override
  String get viagemSaida {
    _$viagemSaidaAtom.context.enforceReadPolicy(_$viagemSaidaAtom);
    _$viagemSaidaAtom.reportObserved();
    return super.viagemSaida;
  }

  @override
  set viagemSaida(String value) {
    _$viagemSaidaAtom.context.conditionallyRunInAction(() {
      super.viagemSaida = value;
      _$viagemSaidaAtom.reportChanged();
    }, _$viagemSaidaAtom, name: '${_$viagemSaidaAtom.name}_set');
  }

  final _$viagemChegadaAtom = Atom(name: '_ItemModelViagemBase.viagemChegada');

  @override
  String get viagemChegada {
    _$viagemChegadaAtom.context.enforceReadPolicy(_$viagemChegadaAtom);
    _$viagemChegadaAtom.reportObserved();
    return super.viagemChegada;
  }

  @override
  set viagemChegada(String value) {
    _$viagemChegadaAtom.context.conditionallyRunInAction(() {
      super.viagemChegada = value;
      _$viagemChegadaAtom.reportChanged();
    }, _$viagemChegadaAtom, name: '${_$viagemChegadaAtom.name}_set');
  }

  final _$_ItemModelViagemBaseActionController =
      ActionController(name: '_ItemModelViagemBase');

  @override
  dynamic setIdViagem(int value) {
    final _$actionInfo = _$_ItemModelViagemBaseActionController.startAction();
    try {
      return super.setIdViagem(value);
    } finally {
      _$_ItemModelViagemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setViagemSaida(String value) {
    final _$actionInfo = _$_ItemModelViagemBaseActionController.startAction();
    try {
      return super.setViagemSaida(value);
    } finally {
      _$_ItemModelViagemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setViagemChegada(String value) {
    final _$actionInfo = _$_ItemModelViagemBaseActionController.startAction();
    try {
      return super.setViagemChegada(value);
    } finally {
      _$_ItemModelViagemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'idViagem: ${idViagem.toString()},viagemSaida: ${viagemSaida.toString()},viagemChegada: ${viagemChegada.toString()}';
    return '{$string}';
  }
}
