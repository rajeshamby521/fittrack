class FoodDirectoryModel {
  String image;
  String name;
  double size;
  double calories;
  double fat;
  double saturatedFat;
  double polyUnsaturatedFat;
  double monoUnsaturatedFat;
  double carbs;
  double dietaryFiber;
  double sugar;
  double protein;
  double cholesterol;
  double sodium;
  double potassium;

  FoodDirectoryModel({
    this.image,
    this.name,
    this.size = 0,
    this.calories = 0,
    this.fat = 0,
    this.saturatedFat = 0,
    this.polyUnsaturatedFat = 0,
    this.monoUnsaturatedFat = 0,
    this.carbs = 0,
    this.dietaryFiber = 0,
    this.sugar = 0,
    this.protein = 0,
    this.cholesterol = 0,
    this.sodium = 0,
    this.potassium = 0,
  });
}
