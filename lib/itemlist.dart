import 'package:aswani_octice/widgets.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key);
  final List<PopularItems> itemsList = [
    PopularItems(
        category: "Commercial",
        name: 'Office Space for Sale \nin mahatma Gandhi\n Road,Kochi',
        location: 'Mg Road,Ravipuram',
        imagePath: 'assets/images/img_8.png',
        price: 12500000.00,
        date: '22 October 2022'),
    PopularItems(
        category: "House",
        name: '3BHK 1799 Sq-ft Flat For sale',
        location: 'Kollam Railway station',
        imagePath: 'assets/images/house.png',
        price: 10000000.00,
        date: '22 October 2022'),
    PopularItems(
        category: "Vehicle",
        name: 'Volkswagen Polo(2017)',
        location: 'Thrissur,Kerala,India',
        imagePath: 'assets/images/img_7.png',
        price: 7600000.00,
        date: '22 October 2022'),
    PopularItems(
        category: "Land",
        name: 'House Plot for Sale',
        location: 'Kottayam Railway',
        imagePath: 'assets/images/land.png',
        price: 4500000.00,
        date: '22 October 2022')
  ];
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 120,
            width: 450,

              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container( height: 100,
                      width: 120,
                      child: Image.asset(
                        itemsList[index].imagePath.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [

          SizedBox(
            height: 30,
            width: (MediaQuery.of(context).size.width)-155,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ CustomWidgets.itemText(itemsList[index].category),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.date_range,size: 18),
                    SizedBox(width: 6,),
                    CustomWidgets.itemText(itemsList[index].date.toString())
                  ],
                ),],
              ),
            ),
          ),

                      // SizedBox(
                      //   height:30,child: Expanded(child: Row(children: [Expanded(child: CustomWidgets.itemText(itemsList[index].category),),SizedBox(width: 10,),Icon(Icons.date_range),Align(alignment: Alignment.topRight,child: CustomWidgets.itemText(itemsList[index].date.toString(),))],))),
            Text(itemsList[index].name,style: TextStyle(color: Colors.blue,),),
            Row(
              children: [Icon(Icons.location_on,size: 16),
                CustomWidgets.itemText(itemsList[index].location),
              ],
            ),

                      Row(children: [CustomWidgets.itemText('Approx Value :  '),CustomWidgets.displayText('Rs.${itemsList[index].price.toString()}')],)


                  ],)
                ],
              ),

          );
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        itemCount: itemsList.length);
  }
}

class PopularItems {
 late  String category, name, location;
 String? imagePath;
 late double price;
  var date;
  PopularItems(
      {required this.category,
      required this.name,
      required this.location,
      required this.imagePath,
      required this.price,
      required this.date});
}
