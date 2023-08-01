import '../Banks.dart';

class Bank {
 late bool status;
 late String message;
 late List<Banks> banks;
  Bank({
      required this.status,
      required this.message,
      required this.banks,});

  Bank.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['banks'] != null) {
      banks = [];
      json['banks'].forEach((v) {
        banks.add(Banks.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (banks != null) {
      map['banks'] = banks.map((v) => v.toJson()).toList();
    }
    return map;
  }

}