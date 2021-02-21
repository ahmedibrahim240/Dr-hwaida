class ProductCourses {
  final title;
  final price;
  final proImageUrl;

  ProductCourses({this.proImageUrl, this.title, this.price});
}

class ProductConsualt {
  final title;
  final price;
  final proImageUrl;
  final date;
  final time;

  ProductConsualt(
      {this.date, this.time, this.proImageUrl, this.title, this.price});
}

List<ProductConsualt> productConsualtList = [];
