import 'package:ecommerce_app/domain/entities/add_to_cart_response_entity.dart';

class AddToCartResponseDm extends AddToCartResponseEntity {
  AddToCartResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddToCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDM.fromJson(json['data']) : null;
  }
}

class DataDM extends DataEntity {
  DataDM({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDM extends AddProductEntity {
  AddProductDM({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
