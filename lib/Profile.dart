import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'BottomNav_Bar.dart'; 
import 'package:flutter_application_1/Shoe.dart';
import 'package:flutter_application_1/homepage.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;
  String? _profileImageUrl;
  String _fullName = 'John Doe';
  String _phoneNumber = '123-456-7890';
  String _email = 'john.doe@example.com';
  String _creditCard = '**** **** **** 1234';
  String _genre = 'Action, Adventure';
  String _address = '123 Main St, City, Country';

  TextEditingController _textEditingController = TextEditingController();
  late String _currentEditingField;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page based on index
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
       
        break;
      default:
        break;
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _profileImageUrl = pickedFile.path;
      });
    }
  }

  void _editText(String field, String initialValue) {
    _currentEditingField = field;
    _textEditingController.text = initialValue;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $_currentEditingField'),
          content: TextFormField(
            controller: _textEditingController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: _saveText,
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveText() {
    setState(() {
      switch (_currentEditingField) {
        case 'Fullname':
          _fullName = _textEditingController.text;
          break;
        case 'Phone Number':
          _phoneNumber = _textEditingController.text;
          break;
        case 'Email':
          _email = _textEditingController.text;
          break;
        case 'Credit Card':
          _creditCard = _textEditingController.text;
          break;
        case 'Genre':
          _genre = _textEditingController.text;
          break;
        case 'Address':
          _address = _textEditingController.text;
          break;
        default:
          break;
      }
    });
    Navigator.of(context).pop();
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          fullName: _fullName,
          phoneNumber: _phoneNumber,
          email: _email,
          creditCard: _creditCard,
          genre: _genre,
          address: _address,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: _profileImageUrl != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(_profileImageUrl!)),
                      )
                    : const Icon(Icons.camera_alt, size: 50),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Fullname: $_fullName'),
              onTap: () => _editText('Fullname', _fullName),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number: $_phoneNumber'),
              onTap: () => _editText('Phone Number', _phoneNumber),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: $_email'),
              onTap: () => _editText('Email', _email),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Card: $_creditCard'),
              onTap: () => _editText('Credit Card', _creditCard),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Genre: $_genre'),
              onTap: () => _editText('Genre', _genre),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address: $_address'),
              onTap: () => _editText('Address', _address),
            ),
          ],
        ),
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

class EditProfilePage extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String creditCard;
  final String genre;
  final String address;

  const EditProfilePage({
    Key? key,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.creditCard,
    required this.genre,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Fullname'),
            subtitle: Text(fullName),
          ),
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text(phoneNumber),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(email),
          ),
          ListTile(
            title: Text('Credit Card'),
            subtitle: Text(creditCard),
          ),
          ListTile(
            title: Text('Genre'),
            subtitle: Text(genre),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text(address),
          ),
        ],
      ),
    );
  }
  
}
