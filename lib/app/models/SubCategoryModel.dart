class SubCategoryModel {
  String subCategoryId;
  String name;
  int categoryId;

  SubCategoryModel(this.subCategoryId, this.name, this.categoryId);

  @override
  String toString() {
    return 'SubCategoryModel{subCategoryId: $subCategoryId, name: $name, categoryId: $categoryId}';
  }
}