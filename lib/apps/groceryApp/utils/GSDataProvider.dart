import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSConstants.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';

List<GSSliderModel> getSliderList() {
  List<GSSliderModel> list = [];
  list.add(GSSliderModel(image: gs_slider_image1));
  list.add(GSSliderModel(image: gs_slider_image2));
  list.add(GSSliderModel(image: gs_slider_image3));
  return list;
}

List<GSCategoryModel> getCategoryList() {
  List<GSCategoryModel> list = [];
  list.add(GSCategoryModel(image: gs_vegetable_img, catgoryName: "Vegetables"));
  list.add(GSCategoryModel(image: gs_sea_food_img, catgoryName: "Sea Food"));
  list.add(GSCategoryModel(image: gs_dairy_product_img, catgoryName: "Dairy Product"));
  list.add(GSCategoryModel(image: gs_bakery_product_img, catgoryName: "Bakery Product"));
  list.add(GSCategoryModel(image: gs_fruits_img, catgoryName: "Fruits"));
  list.add(GSCategoryModel(image: gs_meat_product_img, catgoryName: "Meat"));
  list.add(GSCategoryModel(image: gs_organic_img, catgoryName: "Organic"));
  return list;
}

List<GSRecommendedModel> getRecommendedList() {
  List<GSRecommendedModel> list = [];
  list.add(GSRecommendedModel(
      image: gs_cauliflower_img,
      price: 30,
      salePrice: 10,
      title: "Cauliflower",
      quantity: "100gr",
      qty: 1,
      total: 0,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"));
  list.add(GSRecommendedModel(
      offer: "15%",
      image: gs_carrot_img,
      price: 20,
      salePrice: 10,
      title: "Carrot",
      quantity: "50gr",
      qty: 1,
      total: 0,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"));
  list.add(GSRecommendedModel(
      offer: "30%",
      image: gs_pineappple_img,
      price: 20,
      salePrice: 10,
      title: "Pineapple",
      quantity: "100gr",
      qty: 1,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"));
  list.add(GSRecommendedModel(
      offer: "30%",
      image: gs_assian_pear,
      price: 30,
      salePrice: 20,
      title: "Asian pear",
      quantity: "100gr",
      qty: 1,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"));
  return list;
}

List<GSRecommendedModel> getCategoryListDetailsList() {
  List<GSRecommendedModel> list = [];

  list.add(
    GSRecommendedModel(
      image: gs_cauliflower_img,
      price: 0.22,
      salePrice: 0.12,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      title: "Cauliflower",
      quantity: "100gr",
    ),
  );
  list.add(
    GSRecommendedModel(
      offer: "15%",
      image: gs_carrot_img,
      price: 0.30,
      salePrice: 0.15,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      title: "Carrot",
      quantity: "50gr",
    ),
  );
  return list;
}

List<GSMyOrderModel> getOnCompletedList() {
  List<GSMyOrderModel> list = [];
  list.add(GSMyOrderModel(title: "Cauliflower", date: "Jan 05, 11:30AM", orderStatus: GSCompleted, image: gs_cauliflower_img, cost: "0.12", address: "8618 Hickory Avenue Newington, CT 06111", orderId: "GS1223THG"));
  list.add(GSMyOrderModel(title: "Cauliflower", date: "Jan 05, 11:30AM", orderStatus: GSCompleted, image: gs_cauliflower_img, cost: "0.12", address: "8618 Hickory Avenue Newington, CT 06111", orderId: "GS1223THG"));
  list.add(GSMyOrderModel(title: "Cauliflower", date: "Jan 05, 11:30AM", orderStatus: GSCompleted, image: gs_cauliflower_img, cost: "0.12", address: "8618 Hickory Avenue Newington, CT 06111", orderId: "GS1223THG"));
  list.add(GSMyOrderModel(title: "Cauliflower", date: "Jan 05, 11:30AM", orderStatus: GSCompleted, image: gs_cauliflower_img, cost: "0.12", address: "8618 Hickory Avenue Newington, CT 06111", orderId: "GS1223THG"));
  return list;
}

List<GSMyOrderModel> getOnProgressList() {
  List<GSMyOrderModel> list = [];
  list.add(GSMyOrderModel(title: "Carrot", date: "Jan 30, 11:30AM", orderStatus: GSOnProgress, image: gs_carrot_img, orderId: "GSJS655"));
  list.add(GSMyOrderModel(title: "Carrot", date: "Jan 30, 11:30AM", orderStatus: GSOnProgress, image: gs_carrot_img, orderId: "GSJS655"));
  list.add(GSMyOrderModel(title: "Carrot", date: "Jan 30, 11:30AM", orderStatus: GSOnProgress, image: gs_carrot_img, orderId: "GSJS655"));
  list.add(GSMyOrderModel(title: "Carrot", date: "Jan 30, 11:30AM", orderStatus: GSOnProgress, image: gs_carrot_img, orderId: "GSJS655"));
  return list;
}

List<GSMyOrderModel> getCancelOrderList() {
  List<GSMyOrderModel> list = [];
  list.add(GSMyOrderModel(title: "Pineapple", date: "Jan 1, 2:00PM", orderStatus: GSCancel, image: gs_pineappple_img, orderId: "GSOLN892"));
  list.add(GSMyOrderModel(title: "Pineapple", date: "Jan 1, 2:00PM", orderStatus: GSCancel, image: gs_pineappple_img, orderId: "GSOLN892"));
  list.add(GSMyOrderModel(title: "Pineapple", date: "Jan 1, 2:00PM", orderStatus: GSCancel, image: gs_pineappple_img, orderId: "GSOLN892"));
  list.add(GSMyOrderModel(title: "Pineapple", date: "Jan 1, 2:00PM", orderStatus: GSCancel, image: gs_pineappple_img, orderId: "GSOLN892"));
  return list;
}

List<GSAddressModel> getAddressList() {
  List<GSAddressModel> list = [];
  list.add(GSAddressModel(address: "1980  Cicero Street", city: "Malden", state: "MO", pinCode: "63863"));
  list.add(GSAddressModel(address: "122 Bessida St, Bloomfield, NJ, 07003", city: "Cicero", state: "IL", pinCode: "60650"));
  return list;
}

List<GSPromoModel> getPromoList() {
  List<GSPromoModel> list = [];
  list.add(GSPromoModel(promoImage: gs_slider_image1, offer: "Fruits 30% Off Promos", offerDate: "Available until 20 Feb 2020"));
  list.add(GSPromoModel(promoImage: gs_slider_image2, offer: "Grocery 30% Off Promos", offerDate: "Available until 25 Feb 2020"));
  return list;
}

List<GSNotificationModel> getNotificationList() {
  List<GSNotificationModel> list = [];
  list.add(GSNotificationModel(title: "You got 10% off from your last order", subTitle: "The gift can you can use in next order", heading: "Promo"));
  list.add(GSNotificationModel(title: "Waiting for payment", subTitle: "The gift can you can use in next order", heading: "Transaction"));
  list.add(GSNotificationModel(title: "Rate your order experience", subTitle: "The gift can you can use in next order", heading: "Info"));
  return list;
}
