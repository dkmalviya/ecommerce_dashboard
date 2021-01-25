class CategoryModel {
   String categoryId;
   String title;
   String imageName;


   CategoryModel(this.categoryId, this.title, this.imageName);

  @override
  String toString() {
    return 'CategoryModel{categoryId: $categoryId, title: $title, imageName: $imageName}';
  }
}