import 'Data.dart';

class PopularList {
 late bool status;
 late List<Data> data;
 late String message;
  PopularList({
      required this.status,
      required this.data,
      required this.message,});

  PopularList.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}