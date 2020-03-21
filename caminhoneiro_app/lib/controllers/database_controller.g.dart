// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataBase on _DataBaseBase, Store {
  final _$viagensAtom = Atom(name: '_DataBaseBase.viagens');

  @override
  ObservableList<ItemModelViagem> get viagens {
    _$viagensAtom.context.enforceReadPolicy(_$viagensAtom);
    _$viagensAtom.reportObserved();
    return super.viagens;
  }

  @override
  set viagens(ObservableList<ItemModelViagem> value) {
    _$viagensAtom.context.conditionallyRunInAction(() {
      super.viagens = value;
      _$viagensAtom.reportChanged();
    }, _$viagensAtom, name: '${_$viagensAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'viagens: ${viagens.toString()}';
    return '{$string}';
  }
}
