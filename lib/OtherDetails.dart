class OtherDetails {
 late String details;
  OtherDetails({
      required this.details,});

  OtherDetails.fromJson(dynamic json) {
    details = json['details'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = details;
    return map;
  }

}