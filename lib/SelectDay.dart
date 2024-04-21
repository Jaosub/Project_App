import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Information.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDay extends StatefulWidget {
  @override
  _SelectDayState createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay> {
  DateTime selectedDay = DateTime.now(); // เก็บวันที่ที่ถูกเลือก
  int selectedOption = -1; // เก็บค่าเลือก option ในปุ่ม

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add code here for notification button
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset('assets/Front.png', fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset('assets/site.png', fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                'GG Marmont matelassé mini bag',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing
            // เพิ่มปุ่มเลือกจำนวนวันและราคา
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOptionButton('1 Days', '2,490 ฿', 0),
                _buildOptionButton('3 Days', '6,570 ฿', 1),
                _buildOptionButton('7 Days', '13,230 ฿', 2),
              ],
            ),
            SizedBox(height: 20), // Add spacing
            // เพิ่มปฏิทิน
            Text(
              'วันที่ได้รับของ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Builder(
                builder: (context) {
                  final firstDay = DateTime.utc(2021, 1, 1);
                  final lastDay = DateTime.utc(2030, 12, 31);
                  return Column(
                    children: [
                      TableCalendar(
                        focusedDay: selectedDay, // ใช้ selectedDay เป็น focusedDay
                        firstDay: firstDay,
                        lastDay: lastDay,
                        calendarFormat: CalendarFormat.month,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                        ),
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        onDaySelected: (date, focusedDay) {
                          setState(() {
                            final difference = date.difference(DateTime.now()).inDays;
                            if (difference == 0) {
                              // แสดงเตือนกรุณาเลือก 2-3 วันจากวันปัจจุบัน
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('กรุณาเลือก 2-3 วันจากวันปัจจุบัน'),
                                ),
                              );
                            } else {
                              selectedDay = date; // อัปเดต selectedDay เมื่อวันถูกเลือก
                            }
                          });
                        },
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, date, _) {
                            return Container(
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add your action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _addSelectedDayToFirestore(); // เพิ่มข้อมูลลงใน Firestore เมื่อกดปุ่ม Apply
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: Text('Apply'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String days, String price, int optionIndex) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedOption = optionIndex;
        });
        // Add your action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedOption == optionIndex ? Colors.green : Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Column(
        children: [
          Text(
            days,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _addSelectedDayToFirestore() {
    // เพิ่มข้อมูลลงใน Firestore
    FirebaseFirestore.instance.collection('selected_days').add({
      'selectedDay': selectedDay, // วันที่เลือกจากปฏิทิน
      'selectedOption': selectedOption, // จำนวนวันที่เลือกและราคา
    }).then((value) {
      // กระโดดไปยังหน้า InformationPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InformationPage(productId: value.id)), 
      );
    }).catchError((error) {
      // กรณีเกิดข้อผิดพลาดในการเพิ่มข้อมูล
      print("Failed to add data: $error");
    });
  }
}

class InformationPage extends StatelessWidget {
  final String productId;

  const InformationPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add code here for notification button
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset('assets/Front.png', fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset('assets/site.png', fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                'GG Marmont matelassé mini bag',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing
            // StreamBuilder to fetch product details from Firestore
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('products').doc(productId).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return Text('No Data');
                }

                // Extract data from snapshot
                var data = snapshot.data!.data();
                var productName = data?['name'] ?? 'Unknown';
                var productPrice = data?['price'] ?? 'Unknown';
                var deliveryDate = data?['delivery_date'] ?? 'Unknown';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name: $productName'),
                    Text('Price: $productPrice'),
                    Text('Delivery Date: $deliveryDate'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
