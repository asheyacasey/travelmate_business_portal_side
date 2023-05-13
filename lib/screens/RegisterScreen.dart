import 'package:flutter/material.dart';
import 'package:travelmate_business/screens/HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextStyle _textFieldStyle = TextStyle(
    fontFamily: 'Manrope',
    fontSize: 18,
    color: Colors.black,
  );
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isPageScrollable = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPageIndex < 2) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPageIndex++;
      });
    } else {
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: _textFieldStyle,
                        ),
                        SizedBox(height: 8),
                        TextField(
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
                          decoration: _buildInputDecoration(''),
                          style: _textFieldStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Business Location Address',
                          style: _textFieldStyle,
                        ),
                        SizedBox(height: 8),
                        TextField(
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
                          decoration: _buildInputDecoration(''),
                          style: _textFieldStyle,
                        ),
                      ],
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
                _currentPageIndex == 2 ? 'Finish' : 'Next',
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
