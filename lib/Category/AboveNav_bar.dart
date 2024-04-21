import 'package:flutter/material.dart';
import 'package:flutter_application_1/Category/Bag.dart';
import 'package:flutter_application_1/Category/Clothes.dart';
import 'package:flutter_application_1/Category/Decorations.dart';

class AboveNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // จำนวนแท็บ
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'), // แก้ไขเป็นชื่อของหน้านี้ตามต้องการ
          bottom: TabBar(
            tabs: [
              Tab(text: 'รองเท้า'),
              Tab(text: 'กระเป๋า'),
              Tab(text: 'เสื้อผ้า'),
              Tab(text: 'เครื่องประดับ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Home Page Content')),
            ElevatedButton(
              child: Text('Go to Bag Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BagPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Go to Clothes Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClothesPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Go to Decorations Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DecorationsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
