import 'dart:convert';

import 'package:aswani_octice/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Data.dart';
import 'Popularlist.dart';
import 'homedetaildisplay.dart';

class PopularListScreen extends StatefulWidget {
  const PopularListScreen({Key? key}) : super(key: key);

  @override
  State<PopularListScreen> createState() => _PopularListScreenState();
}

class _PopularListScreenState extends State<PopularListScreen> {
  late Future<List<Data>> listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = fetchUsers();
  }

  Future<List<Data>> fetchUsers() async {
    final response = await rootBundle.loadString('assets/json/popularlist.json');

    var getUsersData = PopularList.fromJson(json.decode(response));

    return getUsersData.data;

    throw Exception('Failed to load Users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[300],
        leading: Icon(Icons.arrow_back),
        title: Text('Popular Items'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Data>>(
            future: listData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var popularData = (snapshot.data as List<Data>)[index];
                      var data = popularData as Data;
                      return SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                                child: Container(
                                  height: 100,
                                  width: 120,
                                  child: GestureDetector(
                                  child: Image.network(
                                    data.image,
                                    fit: BoxFit.fill,
                                  ),
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomedetailDisplay()));
                                    },
                                ),

                              ),
                            ),
                            // SizedBox(
                            //   width: 15,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(width:(MediaQuery.of(context).size.width) - 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width:
                                          (MediaQuery.of(context).size.width) - 120,
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomWidgets.itemText(data.catName),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.date_range, size: 18),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CustomWidgets.itemText(
                                                    data.auxtionDate)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // SizedBox(
                                    //   height:30,child: Expanded(child: Row(children: [Expanded(child: CustomWidgets.itemText(itemsList[index].category),),SizedBox(width: 10,),Icon(Icons.date_range),Align(alignment: Alignment.topRight,child: CustomWidgets.itemText(itemsList[index].date.toString(),))],))),
                                    Container(width: (MediaQuery.of(context).size.width/3)*2,
                                      child: Text(
                                        data.name,
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                    Container(width:((MediaQuery.of(context).size.width/3)*2)-20,
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on, size: 16),
                                         SizedBox(width: ((MediaQuery.of(context).size.width/3)*2)-38,
                                         child:  CustomWidgets.itemText(data.address),),
                                        ],
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        CustomWidgets.itemText('Approx Value :  '),
                                        CustomWidgets.displayText(
                                            'Rs.${data.price}')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                    itemCount: (snapshot.data as List<Data>).length);
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
