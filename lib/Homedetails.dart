import 'Images.dart';
import 'OtherDetails.dart';

class Homedetails {
  late bool status;
  late String message;
  late  String id;
  late String propertyId;
  late String name;
  late String typeOfProperty;
  late List<Images> images;
  late String auctionDate;
  late String postDate;
  late String address;
  late String district;
  late String panchayath;
  late String nearbyCity;
  late String price;
  late String emdAmount;
  late String bank;
  late int verifyStatus;
  late String projectName;
  late String landArea;
  late String hall;
  late String liststatus;
  late String landType;
  late String workArea;
  late String bedrooms;
  late String attached;
  late String bathrooms;
  late String balcony;
  late String livingRoom;
  late String prayerRoom;
  late String floorType;
  late String diningRoom;
  late String kichen;
  late String carParking;
  late String lift;
  late String furniture;
  late String flatNo;
  late String noOfFloors;
  late String waterConnection;
  late String discription;
  late List<OtherDetails> otherDetails;
  late int interestStatus;

  Homedetails({
      required this.status,
      required this.message,
      required this.id,
      required this.propertyId,
      required this.name,
      required this.typeOfProperty,
      required this.images,
      required this.auctionDate,
      required this.postDate,
      required this.address,
      required this.district,
      required this.panchayath,
      required this.nearbyCity,
      required this.price,
      required this.emdAmount,
      required this.bank,
      required this.verifyStatus,
      required this.projectName,
      required this.landArea,
      required this.hall,
      required this.liststatus,
      required this.landType,
      required this.workArea,
      required this.bedrooms,
      required this.attached,
      required this.bathrooms,
      required this.balcony,
      required this.livingRoom,
      required this.prayerRoom,
      required this.floorType,
      required this.diningRoom,
      required this.kichen,
      required this.carParking,
      required this.lift,
      required this.furniture,
      required this.flatNo,
      required this.noOfFloors,
      required this.waterConnection,
      required this.discription,
      required this.otherDetails,
      required this.interestStatus,});

  Homedetails.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
    propertyId = json['property_id'];
    name = json['name'];
    typeOfProperty = json['type_of_property'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    auctionDate = json['auction_date'];
    postDate = json['post_date'];
    address = json['address'];
    district = json['district'];
    panchayath = json['panchayath'];
    nearbyCity = json['nearby_city'];
    price = json['price'];
    emdAmount = json['emd_amount'];
    bank = json['bank'];
    verifyStatus = json['verify_status'];
    projectName = json['project_name'];
    landArea = json['land_area'];
    hall = json['hall'];
    liststatus = json['liststatus'];
    landType = json['land_type'];
    workArea = json['work_area'];
    bedrooms = json['bedrooms'];
    attached = json['attached'];
    bathrooms = json['bathrooms'];
    balcony = json['balcony'];
    livingRoom = json['living_room'];
    prayerRoom = json['prayer_room'];
    floorType = json['floor_type'];
    diningRoom = json['dining_room'];
    kichen = json['kichen'];
    carParking = json['car_parking'];
    lift = json['lift'];
    furniture = json['furniture'];
    flatNo = json['flat_no'];
    noOfFloors = json['no_of_floors'];
    waterConnection = json['water_connection'];
    discription = json['discription'];
    if (json['other_details'] != null) {
      otherDetails = [];
      json['other_details'].forEach((v) {
        otherDetails.add(OtherDetails.fromJson(v));
      });
    }
    interestStatus = json['interest_status'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['id'] = id;
    map['property_id'] = propertyId;
    map['name'] = name;
    map['type_of_property'] = typeOfProperty;
    if (images != null) {
      map['images'] = images.map((v) => v.toJson()).toList();
    }
    map['auction_date'] = auctionDate;
    map['post_date'] = postDate;
    map['address'] = address;
    map['district'] = district;
    map['panchayath'] = panchayath;
    map['nearby_city'] = nearbyCity;
    map['price'] = price;
    map['emd_amount'] = emdAmount;
    map['bank'] = bank;
    map['verify_status'] = verifyStatus;
    map['project_name'] = projectName;
    map['land_area'] = landArea;
    map['hall'] = hall;
    map['liststatus'] = liststatus;
    map['land_type'] = landType;
    map['work_area'] = workArea;
    map['bedrooms'] = bedrooms;
    map['attached'] = attached;
    map['bathrooms'] = bathrooms;
    map['balcony'] = balcony;
    map['living_room'] = livingRoom;
    map['prayer_room'] = prayerRoom;
    map['floor_type'] = floorType;
    map['dining_room'] = diningRoom;
    map['kichen'] = kichen;
    map['car_parking'] = carParking;
    map['lift'] = lift;
    map['furniture'] = furniture;
    map['flat_no'] = flatNo;
    map['no_of_floors'] = noOfFloors;
    map['water_connection'] = waterConnection;
    map['discription'] = discription;
    if (otherDetails != null) {
      map['other_details'] = otherDetails.map((v) => v.toJson()).toList();
    }
    map['interest_status'] = interestStatus;
    return map;
  }

}