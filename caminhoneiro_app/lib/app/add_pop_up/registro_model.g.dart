// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistroModel on _RegistroModelBase, Store {
  final _$registroAtom = Atom(name: '_RegistroModelBase.registro');

  @override
  Registro get registro {
    _$registroAtom.context.enforceReadPolicy(_$registroAtom);
    _$registroAtom.reportObserved();
    return super.registro;
  }

  @override
  set registro(Registro value) {
    _$registroAtom.context.conditionallyRunInAction(() {
      super.registro = value;
      _$registroAtom.reportChanged();
    }, _$registroAtom, name: '${_$registroAtom.name}_set');
  }

  final _$_RegistroModelBaseActionController =
      ActionController(name: '_RegistroModelBase');

  @override
  dynamic setViagem(int value) {
    final _$actionInfo = _$_RegistroModelBaseActionController.startAction();
    try {
      return super.setViagem(value);
    } finally {
      _$_RegistroModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategoria(int value) {
    final _$actionInfo = _$_RegistroModelBaseActionController.startAction();
    try {
      return super.setCategoria(value);
    } finally {
      _$_RegistroModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(String value) {
    final _$actionInfo = _$_RegistroModelBaseActionController.startAction();
    try {
      return super.setDate(value);
    } finally {
      _$_RegistroModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_RegistroModelBaseActionController.startAction();
    try {
      return super.setTitle(value);
    } finally {
      _$_RegistroModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(double value) {
    final _$actionInfo = _$_RegistroModelBaseActionController.startAction();
    try {
      return super.setValue(value);
    } finally {
      _$_RegistroModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'registro: ${registro.toString()}';
    return '{$string}';
  }
}
