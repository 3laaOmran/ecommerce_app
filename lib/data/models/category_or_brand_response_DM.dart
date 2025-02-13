import 'package:ecommerce_app/domain/entities/category_or_brand_response_entity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDm({
    super.results,
    super.message,
    super.statusMsg,
    super.data,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDM.fromJson(v));
      });
    }
  }
}

class CategoryOrBrandDM extends CategoryOrBrandEntity {
  CategoryOrBrandDM({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryOrBrandDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
