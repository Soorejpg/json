class Data {
 late String id;
 late String name;
 late int catId;
 late String catName;
 late String image;
 late String address;
 late String price;
 late String auxtionDate;
  Data({
      required this.id,
      required this.name,
      required this.catId,
      required this.catName,
      required this.image,
      required this.address,
      required this.price,
      required this.auxtionDate,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    image = json['image'];
    address = json['address'];
    price = json['price'];
    auxtionDate = json['auxtion_date'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['cat_id'] = catId;
    map['cat_name'] = catName;
    map['image'] = image;
    map['address'] = address;
    map['price'] = price;
    map['auxtion_date'] = auxtionDate;
    return map;
  }

}