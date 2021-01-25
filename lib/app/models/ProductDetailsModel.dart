class ProductDetailsModel {

  String productId;
  String name;
  String brand;
  int quantityAvailable;
  int weight;
  int qantitySelectedByUser;
  String unit;
  double price;
  String subCategoryId;
  int categoryId;

  ProductDetailsModel(
      this.productId,
      this.name,
      this.brand,
      this.quantityAvailable,
      this.weight,
      this.qantitySelectedByUser,
      this.unit,
      this.price,
      this.subCategoryId,
      this.categoryId);

  @override
  String toString() {
    return 'ProductDetailsModel{productId: $productId, name: $name, brand: $brand, quantityAvailable: $quantityAvailable, weight: $weight, qantitySelectedByUser: $qantitySelectedByUser, unit: $unit, price: $price, subCategoryId: $subCategoryId, categoryId: $categoryId}';
  }
}