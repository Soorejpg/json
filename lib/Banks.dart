class Banks {
  late String bankId;
 late String bankName;
 late String bankLogo;
  Banks({
      required this.bankId,
      required this.bankName,
      required this.bankLogo,});

  Banks.fromJson(dynamic json) {
    bankId = json['bank_id'];
    bankName = json['bank_name'];
    bankLogo = json['bank_logo'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_id'] = bankId;
    map['bank_name'] = bankName;
    map['bank_logo'] = bankLogo;
    return map;
  }

}