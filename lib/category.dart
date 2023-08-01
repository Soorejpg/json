import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[300],
        leading: Icon(Icons.arrow_back),
        title: Text('Category'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: ListView(
        children: [
          Card(
            child: Row(
              children: [
                Image.asset('assets/images/img_3.png'),
                Text('House/Flat')
              ],
            ),
          ),
          Card(
            child: Row(
              children: [
                Image.asset('assets/images/img_4.png'),
                Text('Vehicle')
              ],
            ),
          )
        ],
      ),
    );
  }
}
