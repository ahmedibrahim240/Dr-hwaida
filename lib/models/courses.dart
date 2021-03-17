String contant =
    'We make it easy, fast and affordable to send SMS marketing We make it easy, fast and affordable to send SMS marketing';
String title = 'Dr/ Ahmed Ibrahim';
String date = '12 May 2021';
String oldPrice = '300';
String newPrice = '255';
String courseImageUrl = 'lib/images/aboutus.jpg';
double rating = 4;

class Courses {
  final int id;
  final String courseImageUrl;
  final String courseVideoUrl;
  final String contant;
  final String title;
  final String couslNmae;
  final String date;
  final String type;
  final String oldPrice;
  final String discount;
  // ignore: non_constant_identifier_names
  final String total_time;
  var lessons;
  var features;
  final String rating;
  final String newPrice;

  Courses({
    this.couslNmae,
    this.id,
    this.courseVideoUrl,
    this.type,
    this.discount,
    // ignore: non_constant_identifier_names
    this.total_time,
    this.lessons,
    this.features,
    this.courseImageUrl,
    this.contant,
    this.title,
    this.date,
    this.oldPrice,
    this.newPrice,
    this.rating,
  });
}

List<Courses> listCourses = [];
