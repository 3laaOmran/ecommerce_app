class CategoryOrBrandResponseEntity {
  int? results;
  List<CategoryOrBrandEntity>? data;
  String? message;
  String? statusMsg;

  CategoryOrBrandResponseEntity({
    this.results,
    this.message,
    this.statusMsg,
    this.data,
  });
}

class CategoryOrBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });
}
