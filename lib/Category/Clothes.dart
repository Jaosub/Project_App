import 'package:flutter/material.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({Key? key}) : super(key: key);

  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  final List<String> images = [
    'balenciaga_cloth.png',
    'Dior_cloth.png',
    'Burberry_cloth.png',
    'drew_cloth.png',
    'louis_vuitton_cloth.png',
    'Celine_cloth.png',
    'chanel cloth.png',
    'Fendi_cloth.png',
    'Gucci_cloth.png',
    'Hermes_cloth.png',
    'MCM_cloth.png',
    'offwhite_cloth.png',
    'Prada_cloth.png',
    'supreme_cloth.png',
    'YSL_cloth.png',
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
                  'assets/clothing/${images[index]}', // เปลี่ยนเป็นที่อยู่ของรูปภาพของคุณ
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5), // ระยะห่างระหว่างรูปและข้อความ
              Text(
                images[index].replaceAll('_cloth.png', ''), // แสดงชื่อไฟล์โดยตัดนามสกุล .png ออก
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
