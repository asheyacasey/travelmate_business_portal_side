import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    ProfileTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    double containerWidthPx = 1000.0;
    double containerWidthDp =
        containerWidthPx / MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: containerWidthDp,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                  color: Color(0xFFFBEBAE),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/objects/coconut.png',
                        width: 60.0,
                        height: 100.0,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            children: [
                              TextSpan(
                                text: 'Travelmate for ',
                                style: TextStyle(color: Color(0xFFFF9100)),
                              ),
                              TextSpan(
                                text: 'Business',
                                style: TextStyle(color: Color(0xFF68BB59)),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _tabs[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  // Reusable text style
  TextStyle fredokaTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontFamily: 'Fredoka',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color businessStatusColor = Color(0xFF292D32);

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Status',
              style: fredokaTextStyle(24, businessStatusColor),
            ),
            SizedBox(height: 8.0),
            Text(
              'An overview of your business progress in our itinerary package feature.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFFF5C518),
              ),
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommend Status',
                        style: fredokaTextStyle(20, Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '5+',
                        style: fredokaTextStyle(24, Colors.white),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 1.9, // Adjust the scale factor as needed
                    child: Image.asset(
                      'assets/objects/recommend.png',
                      width: 100,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFFF5C518),
              ),
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'People Interested',
                        style: fredokaTextStyle(20, Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '10+',
                        style: fredokaTextStyle(24, Colors.white),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 1.8, // Adjust the scale factor as needed
                    child: Image.asset(
                      'assets/objects/customer.png',
                      width: 100,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFFF5C518),
              ),
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Review',
                        style: fredokaTextStyle(20, Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '15+',
                        style: fredokaTextStyle(24, Colors.white),
                      ),
                    ],
                  ),
                  // Image.asset(
                  //   'assets/yet_another.png',
                  //   width: 80,
                  //   height: 80,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Tab'),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Tab'),
    );
  }
}
