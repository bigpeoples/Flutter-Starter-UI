class TMNotesModel {
  String? title;
  String? place;
  String? startTime;
  String? endTime;
  String? notes;
  String? priority;
  String? calender;
  bool? isCheckList;


  TMNotesModel({
    this.title,
    this.place,
    this.startTime,
    this.endTime,
    this.notes,
    this.priority,
    this.calender,
    this.isCheckList = false,
  });
}
