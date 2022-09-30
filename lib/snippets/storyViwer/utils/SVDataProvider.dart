import 'package:mighty_ui_kit/snippets/storyViwer/models/SVModel.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/utils/SVImages.dart';

List<SVStoriesModel> getStories() {
  List<SVStoriesModel> list = [];

  list.add(SVStoriesModel(name: 'Smith', img: SVUser1, seen: false, time: '12h'));
  list.add(SVStoriesModel(name: 'Nilkamal', img: SVUser2, seen: false, time: '8m'));
  list.add(SVStoriesModel(name: 'Cheril', img: SVUser3, seen: true, time: '5h'));
  list.add(SVStoriesModel(name: 'Tom', img: SVUser4, seen: false, time: '2h'));
  list.add(SVStoriesModel(name: 'Jerry', img: SVUser5, seen: true, time: '30m'));
  list.add(SVStoriesModel(name: 'Nora', img: SVUser6, seen: false, time: '45m'));
  list.add(SVStoriesModel(name: 'Lia Smith', img: SVUser7, seen: false, time: '14h'));
  list.add(SVStoriesModel(name: 'Kali', img: SVUser1, seen: true, time: '20h'));
  list.add(SVStoriesModel(name: 'Nik Jon', img: SVUser8, seen: false, time: '12h'));
  list.add(SVStoriesModel(name: 'Aysh', img: SVUser5, seen: true, time: '15m'));

  return list;
}
