import 'package:flutter/material.dart';

class DecorationsPage extends StatefulWidget {
  const DecorationsPage({Key? key}) : super(key: key);

  @override
  _DecorationsPageState createState() => _DecorationsPageState();
}

class _DecorationsPageState extends State<DecorationsPage> {
  final List<String> images = [
    'Bottega Veneta_acc.png',
    'Buccelati_acc.png',
    'Burberry_acc.png',
    'Bvlgari_acc.png',
    'Cartier_acc.png',
    'Celine_acc.png',
    'Chanel_acc.png',
    'Fendi_acc.png',
    'Gucci_acc.png',
    'Hermes_acc.png',
    'LouisVuitton_acc.png',
    'Rolex_acc.png',
    'Tiffany and Co._acc.png',
    'Van Cleef_acc.png',
    'YSL_acc.png',
    // เพิ่มรูปภาพตามต้องการ
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // จำนวนหลัก
          mainAxisSpacing: 5.0, // ระยะห่างระหว่างแถว
          crossAxisSpacing: 5.0, // ระยะห่างระหว่างหลัก
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/Acc/${images[index]}', // เปลี่ยนเป็นที่อยู่ของรูปภาพของคุณ
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5), // ระยะห่างระหว่างรูปและข้อความ
              Text(
                images[index].replaceAll('_acc.png', ''), // แสดงชื่อไฟล์โดยตัดนามสกุล .png ออก
                style: TextStyle(
                  fontSize: 12, // ขนาดตัวอักษร
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
