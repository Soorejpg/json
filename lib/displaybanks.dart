import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Banks.dart';

class DisplayBank extends StatelessWidget {
   DisplayBank({Key? key}) : super(key: key);
  final List<Banks> bankList = [
    Banks(
        bankId: "1",
        bankName: "Axis",
        bankLogo:
        "https://www.octiceindia.com/assets/bank/resized/bank_qto0xs.jpg"),
    Banks(
        bankId: "2",
        bankName: "Citi",
        bankLogo:
        "https://www.octiceindia.com/assets/bank/resized/bank_qto10i.jpg"),
    Banks(
        bankId: "3",
        bankName: "HDFC",
        bankLogo:
        "https://www.octiceindia.com/assets/bank/resized/bank_qto0yu.jpg"),
    Banks(
        bankId: "4",
        bankName: "ICICI",
        bankLogo:
        "https://www.octiceindia.com/assets/bank/resized/bank_qto0z4.jpg"),
    Banks(
        bankId: "5",
        bankName: "SBI",
        bankLogo:
        "https://www.octiceindia.com/assets/bank/resized/bank_qto0y9.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return Card(
        child: SizedBox(child: Image.network(bankList[index].bankLogo,fit: BoxFit.contain,),height: 50,width: 80,),
      );

    },
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount:bankList.length ,
    );
  }
}
