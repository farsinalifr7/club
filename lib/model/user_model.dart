// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:club/model/paymentmodel.dart';

class Workers {
  final String name;
  final String mob;
  final String image;
  final DateTime age;
  final bool isUserInput;
  final List<Paymentmodel> payment;
  Workers({
    required this.name,
    required this.mob,
    required this.image,
    required this.age,
    required this.isUserInput,
    required this.payment,
  });
}
