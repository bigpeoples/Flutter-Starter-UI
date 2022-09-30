import 'package:mighty_ui_kit/snippets/model/SNModel.dart';
import 'package:mighty_ui_kit/snippets/utills/SNImages.dart';

List<SNShimmerDataListModel> getShimmerDataList() {
  List<SNShimmerDataListModel> list = [];
  list.add(SNShimmerDataListModel(title: "Accent Chairs", description: 'Accent Chairs Product', price: '30', image: SN_image1));
  list.add(SNShimmerDataListModel(title: "Garden Chairs", description: 'Garden Chairs Product', price: '10', image: SN_image2));
  list.add(SNShimmerDataListModel(title: "Office Chairs", description: 'Office Chairs Product', price: '12', image: SN_image1));
  list.add(SNShimmerDataListModel(title: "Kitchen Chairs", description: 'Kitchen Chairs Product', price: '20', image: SN_image2));
  list.add(SNShimmerDataListModel(title: "Dining Chairs", description: 'Dining Chairs Product', price: '18', image: SN_image1));
  return list;
}
