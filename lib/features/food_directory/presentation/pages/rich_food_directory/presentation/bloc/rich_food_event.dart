abstract class RichFoodEvent {}

class FetchRichFoodDataEvent extends RichFoodEvent {
  String categoryId;
  String offSet;

  FetchRichFoodDataEvent({this.categoryId, this.offSet});
}
