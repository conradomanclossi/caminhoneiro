// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViagemController on _ViagemControllerBase, Store {
  Computed<bool> _$viagemIsTrueComputed;

  @override
  bool get viagemIsTrue =>
      (_$viagemIsTrueComputed ??= Computed<bool>(() => super.viagemIsTrue))
          .value;

  final _$viagemAtom = Atom(name: '_ViagemControllerBase.viagem');

  @override
  Viagem get viagem {
    _$viagemAtom.context.enforceReadPolicy(_$viagemAtom);
    _$viagemAtom.reportObserved();
    return super.viagem;
  }

  @override
  set viagem(Viagem value) {
    _$viagemAtom.context.conditionallyRunInAction(() {
      super.viagem = value;
      _$viagemAtom.reportChanged();
    }, _$viagemAtom, name: '${_$viagemAtom.name}_set');
  }

  final _$_ViagemControllerBaseActionController =
      ActionController(name: '_ViagemControllerBase');

  @override
  dynamic setSaida(String value) {
    final _$actionInfo = _$_ViagemControllerBaseActionController.startAction();
    try {
      return super.setSaida(value);
    } finally {
      _$_ViagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChegada(String value) {
    final _$actionInfo = _$_ViagemControllerBaseActionController.startAction();
    try {
      return super.setChegada(value);
    } finally {
      _$_ViagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'viagem: ${viagem.toString()},viagemIsTrue: ${viagemIsTrue.toString()}';
    return '{$string}';
  }
}
