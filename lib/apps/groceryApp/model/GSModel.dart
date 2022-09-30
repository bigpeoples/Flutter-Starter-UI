class GSSliderModel {
  String? image;

  GSSliderModel({this.image});
}

class GSCategoryModel {
  String? image;
  String? catgoryName;

  GSCategoryModel({this.image, this.catgoryName});
}

class GSRecommendedModel {
  String? offer;
  String? image;
  double? salePrice;
  double? price;
  String? title;
  String? quantity;
  String? description;
  int? qty;
  int? total;

  GSRecommendedModel({this.offer, this.image, this.salePrice, this.price, this.title, this.quantity, this.description, this.qty, this.total});
}

/*class GSCategoryListDetailsModel {
  String offer;
  String image;
  String salePrice;
  String price;
  String description;
  String quantity;
  String title;

  GSCategoryListDetailsModel({this.offer, this.image, this.salePrice, this.price, this.description, this.quantity, this.title});
}*/

class GSMyOrderModel {
  String? title;
  String? date;
  int? orderStatus;
  String? image;
  String? address;
  String? cost;
  String? orderId;

  GSMyOrderModel({this.title, this.date, this.orderStatus, this.image, this.address, this.cost, this.orderId});
}

class GSAddressModel {
  String? address;
  String? city;
  String? state;
  String? pinCode;

  GSAddressModel({this.address, this.city, this.state, this.pinCode});
}

class GSPromoModel {
  String? promoImage;
  String? offer;
  String? offerDate;

  GSPromoModel({this.promoImage, this.offer, this.offerDate});
}

class GSNotificationModel {
  String? title;
  String? subTitle;
  String? heading;

  GSNotificationModel({this.title, this.subTitle, this.heading});
}
