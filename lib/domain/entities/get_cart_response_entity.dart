import 'package:ecommerce_app/domain/entities/product_response_entity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  num? numOfCartItems;
  String? cartId;
  GetCartDataEntity? data;
}

class GetCartDataEntity {
  GetCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetCartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class GetCartProductEntity {
  GetCartProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  ProductEntity? product;
  num? price;
}
