import 'package:flutter/material.dart';
import 'package:travelmate_business/screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _locationAddressController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isPageScrollable = false;

  final TextStyle _textFieldStyle = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    color: Colors.black,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPageIndex < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    } else {
      _saveDataToFirestore(); // Save data to Firestore
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _enablePageScrolling() {
    setState(() {
      _isPageScrollable = true;
    });
  }

  void _disablePageScrolling() {
    setState(() {
      _isPageScrollable = false;
    });
  }

  void _saveDataToFirestore() async {
    // Get the field values
    String email =  _emailController.text;
    String password = _passwordController.text;
    String fullName = _fullNameController.text;
    String companyName = _companyNameController.text;
    String jobTitle = _jobTitleController.text;
    String locationAddress = _locationAddressController.text;
    String contactNumber = _contactNumberController.text;
    String emailAddress = _emailAddressController.text;

    // Create a document in Firestore collection and set the field values
    await FirebaseFirestore.instance.collection('users').add({
      'email' : email,
      'password' : password,
      'full_name': fullName,
      'company_name': companyName,
      'job_title': jobTitle,
      'location_address': locationAddress,
      'contact_number': contactNumber,
      'email_address': emailAddress,
    });

    // Optionally, you can show a success message or navigate to the next screen
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50.0),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xFFB0DB2D),
                ),
                children: [
                  TextSpan(text: 'Travelmate\n'),
                  TextSpan(
                    text: 'for Business',
                    style: TextStyle(
                      color: Color(0xFFF5C518),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            const Text(
              'We’ll need your legal business registration documents so it’s best to have them ready before you start.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                physics: _isPageScrollable
                    ? AlwaysScrollableScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email Address',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _emailController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Create Password',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8), 
                          TextField(
                            controller: _passwordController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Confirm Password',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _passwordController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _fullNameController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Company Name',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _companyNameController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Job Title',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _jobTitleController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Location Address',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _locationAddressController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Business Contact Number',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _contactNumberController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Work Email Address',
                            style: _textFieldStyle,
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _emailAddressController,
                            decoration: _buildInputDecoration(''),
                            style: _textFieldStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'Instruction: To verify the authenticity of your business, please provide relevant information or documentation that confirms your business\'s legitimacy. '
                              'This may include company registration details, tax identification numbers, licenses, or any other official documents. '
                              'Please ensure the information is accurate and up-to-date.',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          SizedBox(height: 16),
                          _buildUploadDocumentWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _goToNextPage,
              onLongPress: _enablePageScrolling,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB0DB2D),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 55),
              ),
              child: Text(
                _currentPageIndex == 3 ? 'Finish' : 'Next',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration _buildInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFF5C518),
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xFFF5C518),
        width: 2.0,
      ),
    ),
  );
}

Widget _buildUploadDocumentWidget() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
    decoration: BoxDecoration(
      color: Color(0xFFF5C518),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.upload,
          color: Colors.white,
        ),
        SizedBox(width: 8.0),
        Text(
          'Upload Document',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
