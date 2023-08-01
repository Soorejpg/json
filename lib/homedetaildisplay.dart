import 'dart:convert';

import 'package:aswani_octice/Images.dart';
import 'package:aswani_octice/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Homedetails.dart';

class HomedetailDisplay extends StatefulWidget {
  const HomedetailDisplay({Key? key}) : super(key: key);

  @override
  State<HomedetailDisplay> createState() => _HomedetailDisplayState();
}

class _HomedetailDisplayState extends State<HomedetailDisplay> {
  late Future<Homedetails> listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = fetchDetails();
  }
  Future<Homedetails> fetchDetails() async {
    final response =
    await rootBundle.loadString('assets/json/home.json');

    var getDetailData = Homedetails.fromJson(json.decode(response));

    return getDetailData;

    throw Exception('Failed to load Users');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[300],
        leading: Icon(Icons.arrow_back),
        title: Text('Residential Apartment/Flat'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Homedetails>(
          future: listData,
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (BuildContext context, int index) {
                     var details = snapshot.data as Homedetails;
                     var dataImages = details.images as List<Images>;
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           CustomWidgets.homeSlideShow(dataImages),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Container(height: 30,width: 250,decoration:  BoxDecoration(
                                 border: Border.all(
                                     color: Colors.black,

                                     ),
                               borderRadius: BorderRadius.all(Radius.circular(15)),

                             ),
                             child: Row(
                               children: [
                                 SizedBox(width: 10,),
                                 Icon(Icons.circle,color: Colors.blue,size: 14,),
                                 SizedBox(width: 10,),
                                 Text(details.auctionDate),
                                 SizedBox(width: 10,),
                                 Text('House/Flat')
                               ],
                             ),),
                             
                           ),
                           SizedBox(height: 30,),
                           Text(details.name,style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 5),),
                           SizedBox(height: 30,),
                           Text('Symbolic Possession',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                           SizedBox(height: 20,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                             Icon(Icons.location_on,size: 18,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(width: MediaQuery.of(context).size.width-60,
                                   child:CustomWidgets.detailText(details.address),),
                                 SizedBox(height: 20,),
                                 CustomWidgets.detailText('Panchayath   : ${details.panchayath}'),
                                 SizedBox(height: 20,),
                                 CustomWidgets.detailText('Nearby Town   : ${details.nearbyCity}'),
                                 SizedBox(height: 20,),
                                 CustomWidgets.detailText('District   : ${details.district}'),
                               ],
                             )

                           ],),
                           SizedBox(height: 20,),
                           Container(height: 30,width: 180,decoration:  BoxDecoration(
                             border: Border.all(
                               color: Colors.black,

                             ),
                             color: Colors.grey[300],
                             borderRadius: BorderRadius.all(Radius.circular(15)),

                           ),child: Center(child: CustomWidgets.displayText('Rs. ${details.price}'),),),
                           SizedBox(
                             height: 20,
                           ),
                           Row(children: [Container(height: 30,width: 180,decoration:  BoxDecoration(
                             border: Border.all(
                               color: Colors.black,

                             ),
                             color: Colors.grey[300],
                             borderRadius: BorderRadius.all(Radius.circular(15)),

                           ),child: Center(child: CustomWidgets.displayText('${ details.verifyStatus==1 ? "Verified":"Not Verified"} '),),),],)

                         ],
                       ),
                     );
                     return CustomWidgets.homeSlideShow(dataImages);


              },
                shrinkWrap: true,
itemCount: 1,
              );
            }
            else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
            } else {
            return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}
