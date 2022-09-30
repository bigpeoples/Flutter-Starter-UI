import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mobx/mobx.dart';

part 'TMAppStore.g.dart';

class TMAppStore = TMAppStoreBase with _$TMAppStore;

abstract class TMAppStoreBase with Store {
  @observable
  ObservableList<TMNotesModel> notesList = ObservableList();

  @action
  void addNotes(TMNotesModel data, {bool isClear = false}) {
    if (isClear) {
      notesList.clear();
    }
    notesList.add(data);
  }

  void removeNotes(TMNotesModel data) {
    notesList.remove(data);
  }

  void updateNotes(TMNotesModel data, TMNotesModel currentData) {
    notesList[notesList.indexOf(currentData)] = data;
  }
}
