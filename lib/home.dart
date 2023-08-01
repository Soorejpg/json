import 'package:aswani_octice/popularlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:aswani_octice/widgets.dart';

import 'Banks.dart';
import 'displaybanks.dart';
import 'drawer.dart';
import 'home.dart';
import 'itemlist.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//id,username,phone ,passwors,email
  final List<Services> services = [
    Services(title: 'House/Flat', image: 'assets/images/img_3.png'),
    Services(title: 'Vehicle', image: 'assets/images/img_4.png'),
    Services(title: 'Land', image: 'assets/images/img_5.png'),
    Services(title: 'Commercial', image: 'assets/images/commme.png'),
    Services(title: 'Others', image: 'assets/images/img_6.png'),
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[300],
        title: Image.asset(
          'assets/images/img_2.png',
          height: 35,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      drawer: DisplayDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListView(
          children: [
            CustomWidgets.showSlideShow(),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: CustomWidgets.displayText('Our Services')),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                services[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            CustomWidgets.displayText(services[index].title)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //mainAxisExtent: 7.0
                  childAspectRatio: 1 / .9,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9),
            ),
            SizedBox(
              height: 15,
            ),
            CustomWidgets.displayText('Popular Listings'),
            ItemList(),
            Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>PopularListScreen()));},
                  child: Text("See More"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                )),
            CustomWidgets.displayText('Associated banks'),
            SizedBox(
              height: 15,
            ),
            Stack(children: [
              SizedBox(height: 80,child: DisplayBank(),),
              Positioned(child: Icon(Icons.arrow_back_ios_new_outlined,size: 18,),left: -5,top: 27,),
              Positioned(child: Icon(Icons.arrow_forward_ios_rounded,size: 18),right: -5,top: 27,),
            ],)

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'CATEGORY'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: 'MY ENQUIRIES'),
        ],
      ),
    );
  }
}

class Services {
  String title, image;
  Services({required this.title, required this.image});
}
