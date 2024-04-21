import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shoe.dart';
import 'package:flutter_application_1/profile.dart';
import 'BottomNav_Bar.dart'; // นำเข้าไฟล์ BottomNav_Bar.dart ที่มีการกำหนด Navbar

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // เพิ่มการเปลี่ยนหน้าตาม index ที่เลือก
    switch (index) {
      case 0:
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

  final List<String> image = [
    'assets/Main/1.png',
    'assets/Main/firstpage.png',
    'assets/Main/Secondpage.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.all(20),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/TRENDS.png'), // รูปภาพด้านบน
          const Text(
            '#RecommendForYou',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              height: 3,
            ),
          ), // ข้อความด้านบน
          Expanded(
            child: _selectedIndex == 0
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300.0,
                          child: PageView.builder(
                            controller: PageController(
                              initialPage: image.length * 10,
                              viewportFraction: 0.8,
                            ),
                            allowImplicitScrolling: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: image.length * 20,
                            itemBuilder: (BuildContext context, int index) {
                              final imageUrl = image[index % image.length];
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        imageUrl,
                                        width: 80.0,
                                        height: 200.0,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(''), // หน้าอื่น ๆ ของแอป
          ),
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
    );
  }
}
