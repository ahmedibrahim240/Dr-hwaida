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

class ConsultantProdect {
  String title;
  String price;
  String proImageUrl;
  String date;
  String time;
  int _id;
  int dateId;
  int prodectID;

  ConsultantProdect(dynamic obj) {
    _id = obj['id'];
    prodectID = obj['prodectID'];
    dateId = obj['dateId'];
    title = obj['title'];
    price = obj['price'];
    proImageUrl = obj['proImageUrl'];
    date = obj['date'];
    time = obj['time'];
  }
  ConsultantProdect.formMap(Map<String, dynamic> data) {
    _id = data['id'];
    prodectID = data['prodectID'];
    dateId = data['dateId'];
    title = data['title'];
    price = data['price'];
    proImageUrl = data['proImageUrl'];
    date = data['date'];
    time = data['time'];
  }
  Map<String, dynamic> toMap() => {
        'id': _id,
        'prodectID': prodectID,
        'dateId': dateId,
        'title': title,
        'price': price,
        'proImageUrl': proImageUrl,
        'date': date,
        'time': time,
      };
}

List<ProductConsualt> productConsualtList = [];
