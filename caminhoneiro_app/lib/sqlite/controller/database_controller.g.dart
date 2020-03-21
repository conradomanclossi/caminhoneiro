// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataBase on _DataBaseBase, Store {
  final _$viagensAtom = Atom(name: '_DataBaseBase.viagens');

  @override
  List<Viagem> get viagens {
    _$viagensAtom.context.enforceReadPolicy(_$viagensAtom);
    _$viagensAtom.reportObserved();
    return super.viagens;
  }

  @override
  set viagens(List<Viagem> value) {
    _$viagensAtom.context.conditionallyRunInAction(() {
      super.viagens = value;
      _$viagensAtom.reportChanged();
    }, _$viagensAtom, name: '${_$viagensAtom.name}_set');
  }

  final _$categoriasAtom = Atom(name: '_DataBaseBase.categorias');

  @override
  List<Categoria> get categorias {
    _$categoriasAtom.context.enforceReadPolicy(_$categoriasAtom);
    _$categoriasAtom.reportObserved();
    return super.categorias;
  }

  @override
  set categorias(List<Categoria> value) {
    _$categoriasAtom.context.conditionallyRunInAction(() {
      super.categorias = value;
      _$categoriasAtom.reportChanged();
    }, _$categoriasAtom, name: '${_$categoriasAtom.name}_set');
  }

  final _$registrosAtom = Atom(name: '_DataBaseBase.registros');

  @override
  List<Registro> get registros {
    _$registrosAtom.context.enforceReadPolicy(_$registrosAtom);
    _$registrosAtom.reportObserved();
    return super.registros;
  }

  @override
  set registros(List<Registro> value) {
    _$registrosAtom.context.conditionallyRunInAction(() {
      super.registros = value;
      _$registrosAtom.reportChanged();
    }, _$registrosAtom, name: '${_$registrosAtom.name}_set');
  }

  final _$loadDataBaseAsyncAction = AsyncAction('loadDataBase');

  @override
  Future<void> loadDataBase() {
    return _$loadDataBaseAsyncAction.run(() => super.loadDataBase());
  }

  final _$loadViagensAsyncAction = AsyncAction('loadViagens');

  @override
  Future<void> loadViagens() {
    return _$loadViagensAsyncAction.run(() => super.loadViagens());
  }

  final _$loadCategoriasAsyncAction = AsyncAction('loadCategorias');

  @override
  Future<void> loadCategorias() {
    return _$loadCategoriasAsyncAction.run(() => super.loadCategorias());
  }

  final _$loadRegistrosAsyncAction = AsyncAction('loadRegistros');

  @override
  Future<void> loadRegistros() {
    return _$loadRegistrosAsyncAction.run(() => super.loadRegistros());
  }

  final _$_DataBaseBaseActionController =
      ActionController(name: '_DataBaseBase');

  @override
  dynamic saveViagem(Viagem value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.saveViagem(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateViagem(Viagem value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.updateViagem(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteViagem(int id) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.deleteViagem(id);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveCategoria(Categoria value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.saveCategoria(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCategoria(Categoria value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.updateCategoria(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteCategoria(int id) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.deleteCategoria(id);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveRegistro(Registro value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.saveRegistro(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateRegistro(Registro value) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.updateRegistro(value);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteRegistro(int id) {
    final _$actionInfo = _$_DataBaseBaseActionController.startAction();
    try {
      return super.deleteRegistro(id);
    } finally {
      _$_DataBaseBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'viagens: ${viagens.toString()},categorias: ${categorias.toString()},registros: ${registros.toString()}';
    return '{$string}';
  }
}
