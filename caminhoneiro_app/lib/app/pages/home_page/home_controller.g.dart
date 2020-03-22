// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Viagem>> _$viagemFilteredComputed;

  @override
  List<Viagem> get viagemFiltered => (_$viagemFilteredComputed ??=
          Computed<List<Viagem>>(() => super.viagemFiltered))
      .value;

  final _$viagensAtom = Atom(name: '_HomeControllerBase.viagens');

  @override
  ObservableList<Viagem> get viagens {
    _$viagensAtom.context.enforceReadPolicy(_$viagensAtom);
    _$viagensAtom.reportObserved();
    return super.viagens;
  }

  @override
  set viagens(ObservableList<Viagem> value) {
    _$viagensAtom.context.conditionallyRunInAction(() {
      super.viagens = value;
      _$viagensAtom.reportChanged();
    }, _$viagensAtom, name: '${_$viagensAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_HomeControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$loadDataBaseAsyncAction = AsyncAction('loadDataBase');

  @override
  Future<void> loadDataBase() {
    return _$loadDataBaseAsyncAction.run(() => super.loadDataBase());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic saveViagem(Viagem value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.saveViagem(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateViagem(Viagem value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.updateViagem(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteViagem(int id) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.deleteViagem(id);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'viagens: ${viagens.toString()},filter: ${filter.toString()},viagemFiltered: ${viagemFiltered.toString()}';
    return '{$string}';
  }
}
