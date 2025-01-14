import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];

  CategoryModel categoryModel = CategoryModel();
  categoryModel.title = "Business";
  categoryModel.image = "assets/images/buisness.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Entertainment";
  categoryModel.image = "assets/images/entertainment.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "General";
  categoryModel.image = "assets/images/general.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Health";
  categoryModel.image = "assets/images/health.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Science";
  categoryModel.image = "assets/images/science.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Sports";
  categoryModel.image = "assets/images/sports.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Technology";
  categoryModel.image = "assets/images/technology.jpeg";
  category.add(categoryModel);

  return category;
}
