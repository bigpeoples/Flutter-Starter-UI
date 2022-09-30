// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TMAppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TMAppStore on TMAppStoreBase, Store {
  final _$notesListAtom = Atom(name: 'TMAppStoreBase.notesList');

  @override
  ObservableList<TMNotesModel> get notesList {
    _$notesListAtom.reportRead();
    return super.notesList;
  }

  @override
  set notesList(ObservableList<TMNotesModel> value) {
    _$notesListAtom.reportWrite(value, super.notesList, () {
      super.notesList = value;
    });
  }

  final _$TMAppStoreBaseActionController =
      ActionController(name: 'TMAppStoreBase');

  @override
  void addNotes(TMNotesModel data, {bool isClear = false}) {
    final _$actionInfo = _$TMAppStoreBaseActionController.startAction(
        name: 'TMAppStoreBase.addNotes');
    try {
      return super.addNotes(data, isClear: isClear);
    } finally {
      _$TMAppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notesList: ${notesList}
    ''';
  }
}
