import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_1/SelectDay.dart';


class GucciBagPage extends StatefulWidget {
  const GucciBagPage({Key? key}) : super(key: key);

  @override
  _GucciBagPageState createState() => _GucciBagPageState();
}

class _GucciBagPageState extends State<GucciBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gucci Bags'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // กล่องแรก
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectDay()), 
                );
              },
              child: Container(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F0F0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // รูปภาพ
                    Center(
                      child: Image.asset(
                        'assets/Front.png', // เปลี่ยนเป็นที่อยู่รูปของคุณ
                        fit: BoxFit.contain, // ให้รูปมีขนาดพอดีกับพื้นที่ทั้งหมดของ Container
                        height: 200, // ปรับความสูงของรูป
                        width: 200, // ปรับความกว้างของรูป
                      ),
                    ),
                    // ข้อความชื่อสินค้า
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        'GG MARMONT MATELASSE MINI BAG', // เปลี่ยนเป็นชื่อสินค้าที่ต้องการแสดง
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // ข้อความราคาสินค้า
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        '\$200', // เปลี่ยนเป็นราคาที่ต้องการแสดง
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // แถบรีวิว
                    Positioned(
                      bottom: 30,
                      right: 10,
                      child: RatingBar.builder(
                        initialRating: 4.5, // คะแนนเริ่มต้น
                        minRating: 1, // คะแนนต่ำสุด
                        direction: Axis.horizontal,
                        allowHalfRating: true, // อนุญาตให้ให้คะแนนทศนิยม
                        itemCount: 5, // จำนวนดาวทั้งหมด
                        itemSize: 20, // ขนาดของแต่ละดาว
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // อัปเดตคะแนน
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // กล่องที่สอง
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF2F0F0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // รูปภาพ
                  Center(
                    child: Image.asset(
                      'assets/Gucci1.png', // เปลี่ยนเป็นที่อยู่รูปของคุณ
                      fit: BoxFit.contain, // ให้รูปมีขนาดพอดีกับพื้นที่ทั้งหมดของ Container
                      height: 200, // ปรับความสูงของรูป
                      width: 200, // ปรับความกว้างของรูป
                    ),
                  ),
                  // ข้อความชื่อสินค้า
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'OPHIDIA GG MINI TOP HANDLE BAG', // เปลี่ยนเป็นชื่อสินค้าที่ต้องการแสดง
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ข้อความราคาสินค้า
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      '\$250', // เปลี่ยนเป็นราคาที่ต้องการแสดง
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // แถบรีวิว
                  Positioned(
                    bottom: 30,
                    right: 10,
                    child: RatingBar.builder(
                      initialRating: 4.0, // คะแนนเริ่มต้น
                      minRating: 1, // คะแนนต่ำสุด
                      direction: Axis.horizontal,
                      allowHalfRating: true, // อนุญาตให้ให้คะแนนทศนิยม
                      itemCount: 5, // จำนวนดาวทั้งหมด
                      itemSize: 20, // ขนาดของแต่ละดาว
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // อัปเดตคะแนน
                        print(rating);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // กล่องที่สาม
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF2F0F0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // รูปภาพ
                  Center(
                    child: Image.asset(
                      'assets/gucci_bag.png', // เปลี่ยนเป็นที่อยู่รูปของคุณ
                      fit: BoxFit.contain, // ให้รูปมีขนาดพอดีกับพื้นที่ทั้งหมดของ Container
                      height: 200, // ปรับความสูงของรูป
                      width: 200, // ปรับความกว้างของรูป
                    ),
                  ),
                  // ข้อความชื่อสินค้า
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'Gucci Bag 3', // เปลี่ยนเป็นชื่อสินค้าที่ต้องการแสดง
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ข้อความราคาสินค้า
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      '\$300', // เปลี่ยนเป็นราคาที่ต้องการแสดง
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // แถบรีวิว
                  Positioned(
                    bottom: 30,
                    right: 10,
                    child: RatingBar.builder(
                      initialRating: 4.2, // คะแนนเริ่มต้น
                      minRating: 1, // คะแนนต่ำสุด
                      direction: Axis.horizontal,
                      allowHalfRating: true, // อนุญาตให้ให้คะแนนทศนิยม
                      itemCount: 5, // จำนวนดาวทั้งหมด
                      itemSize: 20, // ขนาดของแต่ละดาว
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // อัปเดตคะแนน
                        print(rating);
                      },
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
