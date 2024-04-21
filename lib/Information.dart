import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InformationPage extends StatelessWidget {
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
              stream: FirebaseFirestore.instance.collection('products').doc('productId').snapshots(),
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

                // Use the extracted data to display in your app
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
