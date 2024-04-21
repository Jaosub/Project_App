import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
// import 'package:firebase_core/firebase_core.dart'; // ลบ Firebase Core
// import 'package:cloud_firestore/cloud_firestore.dart'; // ลบ Cloud Firestore
// import 'package:firebase_auth/firebase_auth.dart'; // ลบ Firebase Auth
// import 'package:flutter_application_1/main.dart'; // ลบการเรียกใช้ MainPage หรือ LoginPage จากโปรเจกต์ของคุณ

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  String _selectedCountry = 'Select Country';
  String _selectedSex = '';
  bool _agreedToTerms = false;
  String _password = '';

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _ccvController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _idCardController,
              decoration: InputDecoration(labelText: 'Creditcard number'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _ccvController,
              decoration: InputDecoration(labelText: 'CCV'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              items: <String>[
                'Select Country',
                'อุบลราชธานี',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                });
              },
              decoration: InputDecoration(labelText: 'Country'),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedSex,
                  onChanged: (value) {
                    setState(() {
                      _selectedSex = value!;
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _selectedSex,
                  onChanged: (value) {
                    setState(() {
                      _selectedSex = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
              maxLines: null,
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreedToTerms = value!;
                    });
                  },
                ),
                const Text(
                  'I agree to the Terms & Conditions',
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _agreedToTerms ? _register : null,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register() async {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String idCard = _idCardController.text;
    String ccv = _ccvController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;
    String country = _selectedCountry;
    String sex = _selectedSex;
    String address = _addressController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Passwords do not match'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // UserCredential userCredential =
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );

    // String userId = userCredential.user!.uid;

    // await FirebaseFirestore.instance.collection('users').doc(userId).set({
    //   'firstName': firstName,
    //   'lastName': lastName,
    //   'idCard': idCard,
    //   'ccv': ccv,
    //   'email': email,
    //   'phoneNumber': phoneNumber,
    //   'country': country,
    //   'sex': sex,
    //   'address': address,
    // });

    // print('Registration complete!');
     
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}
