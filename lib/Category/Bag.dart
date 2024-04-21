import 'package:flutter/material.dart';
import 'package:flutter_application_1/Gucci_Bag.dart'; // Import SelectDay

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  // รายการรูปภาพ
  final List<String> images = [
    'Balenciaga.png',
    'Bottega Veneta.png',
    'Celine.png',
    'Chanel.png',
    'Dior.png',
    'Goyard.png',
    'Gucci.png',
    'Hermes.png',
    'Loewe.png',
    'Louis Vuiton.png',
    'MCM.png',
    'MiuMiu.png',
    'Prada.png',
    'Valentino.png',
    'YSL.png',
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
                child: GestureDetector(
                  onTap: () {
                    // เช็คว่ารูปภาพที่ถูกเลือกเป็น Gucci หรือไม่
                    if (images[index] == 'Gucci.png') {
                      // นำทางไปยังหน้า SelectDay.dart
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GucciBagPage()),
                      );
                    } else {
                      // กรณีที่ไม่ใช่ Gucci สามารถเพิ่มการนำทางไปยังหน้าอื่น ๆ ตามต้องการได้
                    }
                  },
                  child: Image.asset(
                    'assets/Bag/${images[index]}', // เปลี่ยนเป็นที่อยู่ของรูปภาพของคุณ
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5), // ระยะห่างระหว่างรูปและข้อความ
              Text(
                images[index].replaceAll('.png', ''), // แสดงชื่อไฟล์โดยตัดนามสกุล .png ออก
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
