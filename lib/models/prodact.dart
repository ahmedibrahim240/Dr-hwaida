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
  final consulId;
  final dateId;

  ProductConsualt({
    this.date,
    this.time,
    this.proImageUrl,
    this.title,
    this.price,
    this.consulId,
    this.dateId,
  });
}

class SaveProduct {
  var title;
  var price;
  var proImageUrl;
  var date;
  var time;
  var consulId;
  var dateId;
  // SaveProduct(dynamic obj) {
  //   consulId = obj['consulId'];
  //   dateId = obj['dateId'];
  //   title = obj['title'];
  //   price = obj['price'];
  //   proImageUrl = obj['proImageUrl'];
  //   date = obj['date'];
  //   time = obj['time'];
  // }
  SaveProduct(
      {this.consulId,
      this.date,
      this.dateId,
      this.price,
      this.proImageUrl,
      this.time,
      this.title});
  SaveProduct.foromMap(Map<String, dynamic> data) {
    consulId = data['consulId'];
    dateId = data['dateId'];
    title = data['title'];
    price = data['price'];
    proImageUrl = data['proImageUrl'];
    date = data['date'];
    time = data['time'];
  }
  Map<String, dynamic> toMap() => {
        'consulId': consulId,
        'dateId': dateId,
        'title': title,
        'price': price,
        'proImageUrl': proImageUrl,
        'date': date,
        'time': time,
      };
}

List<ProductConsualt> productConsualtList = [];
