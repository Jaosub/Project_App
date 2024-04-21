import 'package:flutter/material.dart';
import 'package:flutter_application_1/Category/Bag.dart';
import 'package:flutter_application_1/Category/Clothes.dart';
import 'package:flutter_application_1/Category/Decorations.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/Profile.dart';
import 'package:flutter_application_1/BottomNav_bar.dart';

class ShoePage extends StatefulWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  _ShoePageState createState() => _ShoePageState();
}

class _ShoePageState extends State<ShoePage> {
  final List<String> images = [
    'Balenciaga_shoe.png',
    'Amina Muaddi_shoe.png',
    'Burberry_shoe.png',
    'Chanel_shoe.png',
    'Dior_shoe.png',
    'Celine_shoe.png',
    'Fendi_shoe.png',
    'Hermes_shoe.png',
    'Louis_Vuitton_shoe.png',
    'MCM_shoe.png',
    'MiuMiu_shoe.png',
    'Prada_shoe.png',
    'Valentino_shoe.png',
    'YSL_shoe.png',
    // เพิ่มรูปภาพตามต้องการ
  ];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // เพิ่มการเปลี่ยนหน้าตาม index ที่เลือก
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ShoePage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
    }
  }

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
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // จำนวนหลัก
                mainAxisSpacing: 1.0, // ระยะห่างระหว่างแถว
                crossAxisSpacing: 1.0, // ระยะห่างระหว่างหลัก
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Expanded(
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/Shoe/${images[index]}', // เปลี่ยนเป็นที่อยู่ของรูปภาพของคุณ
                        )
                      ),
                    ),
                    SizedBox(height: 5), // ระยะห่างระหว่างรูปและข้อความ
                    Text(
                      images[index].replaceAll('_shoe.png', ''), // แสดงชื่อไฟล์โดยตัดนามสกุล .png ออก
                      style: TextStyle(
                        fontSize: 12, // ขนาดตัวอักษร
                      ),
                    ),
                  ],
                );
              },
            ),
            BagPage(),
            ClothesPage(),
            DecorationsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // ปิด animation
          items: navBarItems
              .map((item) => BottomNavigationBarItem(
                    icon: item.icon,
                    label: item.label,
                  ))
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ShoePage(),
  ));
}
