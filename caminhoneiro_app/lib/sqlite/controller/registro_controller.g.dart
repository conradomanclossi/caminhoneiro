// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistroController on _RegistroControllerBase, Store {
  Computed<bool> _$registroIsTrueComputed;

  @override
  bool get registroIsTrue =>
      (_$registroIsTrueComputed ??= Computed<bool>(() => super.registroIsTrue))
          .value;

  final _$registroAtom = Atom(name: '_RegistroControllerBase.registro');

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

  final _$_RegistroControllerBaseActionController =
      ActionController(name: '_RegistroControllerBase');

  @override
  dynamic setViagemId(int value) {
    final _$actionInfo =
        _$_RegistroControllerBaseActionController.startAction();
    try {
      return super.setViagemId(value);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategoriaId(int value) {
    final _$actionInfo =
        _$_RegistroControllerBaseActionController.startAction();
    try {
      return super.setCategoriaId(value);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(String value) {
    final _$actionInfo =
        _$_RegistroControllerBaseActionController.startAction();
    try {
      return super.setDate(value);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo =
        _$_RegistroControllerBaseActionController.startAction();
    try {
      return super.setTitle(value);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(double value) {
    final _$actionInfo =
        _$_RegistroControllerBaseActionController.startAction();
    try {
      return super.setValue(value);
    } finally {
      _$_RegistroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'registro: ${registro.toString()},registroIsTrue: ${registroIsTrue.toString()}';
    return '{$string}';
  }
}
