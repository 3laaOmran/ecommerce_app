import 'package:ecommerce_app/data/models/product_response_DM.dart';
import 'package:ecommerce_app/domain/entities/get_cart_response_entity.dart';

class GetCartResponseDm extends GetCartResponseEntity {
  GetCartResponseDm({
    super.status,
    super.numOfCartItems,
    super.cartId,
    this.message,
    this.statusMsg,
    super.data,
  });

  String? message;
  String? statusMsg;

  GetCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartDataDM.fromJson(json['data']) : null;
  }
}

class GetCartDataDM extends GetCartDataEntity {
  GetCartDataDM({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartDataDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetCartProductDM extends GetCartProductEntity {
  GetCartProductDM({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }
}
