import 'package:DrHwaida/models/consultant.dart';

class Visits {
  final int id;
  final int consultantId;
  final String date;
  final String time;
  final String name;
  final Consultant consultant;
  // ignore: non_constant_identifier_names
  final String payment_method;
  // ignore: non_constant_identifier_names
  final int total_cost;

  Visits({
    this.consultant,
    // ignore: non_constant_identifier_names
    this.payment_method,
    // ignore: non_constant_identifier_names
    this.total_cost,
    this.id,
    this.consultantId,
    this.date,
    this.time,
    this.name,
  });
}
