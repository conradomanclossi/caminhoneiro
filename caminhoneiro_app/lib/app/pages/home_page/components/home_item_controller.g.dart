// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeItemController on _HomeItemControllerBase, Store {
  final _$registroAtom = Atom(name: '_HomeItemControllerBase.registro');

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

  final _$databaseAtom = Atom(name: '_HomeItemControllerBase.database');

  @override
  DataBase get database {
    _$databaseAtom.context.enforceReadPolicy(_$databaseAtom);
    _$databaseAtom.reportObserved();
    return super.database;
  }

  @override
  set database(DataBase value) {
    _$databaseAtom.context.conditionallyRunInAction(() {
      super.database = value;
      _$databaseAtom.reportChanged();
    }, _$databaseAtom, name: '${_$databaseAtom.name}_set');
  }

  final _$_HomeItemControllerBaseActionController =
      ActionController(name: '_HomeItemControllerBase');

  @override
  dynamic getCategoria(int id) {
    final _$actionInfo =
        _$_HomeItemControllerBaseActionController.startAction();
    try {
      return super.getCategoria(id);
    } finally {
      _$_HomeItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'registro: ${registro.toString()},database: ${database.toString()}';
    return '{$string}';
  }
}
