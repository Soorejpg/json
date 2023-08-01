class Images {
  late String image;
  Images({
      required this.image,});

  Images.fromJson(dynamic json) {
    image = json['image'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    return map;
  }

}