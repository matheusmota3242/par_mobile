// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApiService on ApiServiceBase, Store {
  Computed<bool> _$getIsLoadingComputed;

  @override
  bool get getIsLoading =>
      (_$getIsLoadingComputed ??= Computed<bool>(() => super.getIsLoading))
          .value;

  final _$isLoadingAtom = Atom(name: 'ApiServiceBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$ApiServiceBaseActionController =
      ActionController(name: 'ApiServiceBase');

  @override
  dynamic setIsLoading(bool isLoadingParam) {
    final _$actionInfo = _$ApiServiceBaseActionController.startAction();
    try {
      return super.setIsLoading(isLoadingParam);
    } finally {
      _$ApiServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},getIsLoading: ${getIsLoading.toString()}';
    return '{$string}';
  }
}
