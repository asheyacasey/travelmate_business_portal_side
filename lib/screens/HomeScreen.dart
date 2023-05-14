import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                          ],
                        ),
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
        selectedItemColor: Color(0xFFF5C518), // Set the selected item color
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 40.0,
              height: 40.0,
              color: _currentIndex == 0 ? Color(0xFFF5C518) : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              width: 40.0,
              height: 40.0,
              color: _currentIndex == 1 ? Color(0xFFF5C518) : Colors.grey,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 40.0,
              height: 40.0,
              color: _currentIndex == 2 ? Color(0xFFF5C518) : Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentCarouselPage = 0;

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

            // Inside your HomeTab widget's build method
            Container(
              width: double.infinity, // Set the width to match the other containers
              height: 240, // Adjust the height as needed
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              child: CarouselSlider(
                items: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    child: Image.asset(
                      'assets/images/travel_1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    child: Image.asset(
                      'assets/images/travel_2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    child: Image.asset(
                      'assets/images/travel_3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    child: Image.asset(
                      'assets/images/travel_4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Add more images as needed
                ],
                options: CarouselOptions(
                  height: 240, // Adjust the height as needed
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0, // Fill the entire container
                  initialPage: _currentCarouselPage,
                  enableInfiniteScroll: true,
                  reverse: true, // Slide only in the left direction
                  autoPlay: false, // Disable auto-play and animation
                  enlargeCenterPage: false, // Disable zooming effect
                  scrollDirection: Axis.horizontal,
                  // Add indicators
                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselPage = index;
                    });
                  },
                ),
              ),
            ),


            SizedBox(height: 16.0),
// Recommend Status
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
                    scale: 1.9,
                    child: Image.asset(
                      'assets/objects/recommend.png',
                      width: 100,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),

// People Interested
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
                    scale: 1.8,
                    child: Image.asset(
                      'assets/objects/customer.png',
                      width: 100,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            // Customer Review
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFFF5C518),
              ),
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Review',
                    style: fredokaTextStyle(20, Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '150 Global Ratings',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  buildRatingBar(
                      '5 stars', 0.8, '80%', Color(0xFFFFFFFF), Colors.white),
                  SizedBox(height: 8.0),
                  buildRatingBar(
                      '4 stars', 0.5, '50%', Color(0xFFFFFFFF), Colors.white),
                  SizedBox(height: 8.0),
                  buildRatingBar(
                      '3 stars', 0.3, '30%', Color(0xFFFFFFFF), Colors.white),
                  SizedBox(height: 8.0),
                  buildRatingBar(
                      '2 stars', 0.1, '10%', Color(0xFFFFFFFF), Colors.white),
                  SizedBox(height: 8.0),
                  buildRatingBar(
                      '1 star   ', 0.05, '5%', Color(0xFFFFFFFF), Colors.white),
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
  // Reusable text style
  Color businessStatusColor = Color(0xFF292D32);
  TextStyle ManropeTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle ManropeTextStyleBold(double fontSize, Color color) {
    return TextStyle(
      fontFamily: 'Manrope',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  TextStyle FredokaTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontFamily: 'Fredoka',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  BoxDecoration customBoxDecoration(Color strokeColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(
        color: strokeColor,
        width: 2.0,
      ),
    );
  }

  Widget Build_info(String title, String name, String contNum, String email) {
    return Container(
      height: 300,
      decoration: customBoxDecoration(Color(0xFFB0DB2D)),
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fredokaTextStyle(18, Colors.black),
              ),
              IconButton(
                icon: Image(
                  image: AssetImage(
                      'assets/icons/edit_icon.png'), // Replace 'assets/edit_icon.png' with the actual path to your image
                  width: 24, // Set the desired width
                  height: 24, // Set the desired height
                ),
                onPressed: () {
                  // Handle edit button press
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 35.0, left: 10.0),
            child: Transform.scale(
              scale: 1.9, // Adjust the scale factor as needed
              child: Image.asset(
                'assets/objects/user_temp_DP.png',
                width: 100,
                height: 80,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                'Name: ',
                style: ManropeTextStyle(14, Colors.black),
              ),
              Text(
                name,
                style: ManropeTextStyleBold(14, Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Contact Number:',
                style: ManropeTextStyle(14, Colors.black),
              ),
              Text(
                contNum,
                style: ManropeTextStyleBold(14, Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Email Address:',
                style: ManropeTextStyle(14, Colors.black),
              ),
              Text(
                email,
                style: ManropeTextStyleBold(14, Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLocation(String title, String description, double boxHeight) {
    return Container(
      height: boxHeight,
      decoration: customBoxDecoration(Color(0xFFB0DB2D)),
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fredokaTextStyle(18, Colors.black),
              ),
              IconButton(
                icon: Image(
                  image: AssetImage(
                      'assets/icons/edit_icon.png'), // Replace 'assets/edit_icon.png' with the actual path to your image
                  width: 24, // Set the desired width
                  height: 24, // Set the desired height
                ),
                onPressed: () {
                  // Handle edit button press
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: ManropeTextStyle(14, Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildAbout(String title, String description, double boxHeight) {
    return Container(
      height: boxHeight,
      decoration: customBoxDecoration(Color(0xFFB0DB2D)),
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: fredokaTextStyle(18, Colors.black),
                  ),
                  SizedBox(
                      width:
                          4), // Add a small spacing between the title and the verified badge
                  Image.asset(
                    'assets/objects/verifiedBadge.png', // Replace 'assets/icons/verifiedBadge.png' with the actual path to your image
                    width: 24, // Set the desired width
                    height: 24, // Set the desired height
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset(
                  'assets/icons/edit_icon.png', // Replace 'assets/icons/edit_icon.png' with the actual path to your image
                  width: 24, // Set the desired width
                  height: 24, // Set the desired height
                ),
                onPressed: () {
                  // Handle edit button press
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: ManropeTextStyle(14, Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildCategory(String title, String description, double boxHeight) {
    return Container(
      height: boxHeight,
      decoration: customBoxDecoration(Color(0xFFB0DB2D)),
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fredokaTextStyle(18, Colors.black),
              ),
              IconButton(
                icon: Image(
                  image: AssetImage(
                      'assets/icons/edit_icon.png'), // Replace 'assets/edit_icon.png' with the actual path to your image
                  width: 24, // Set the desired width
                  height: 24, // Set the desired height
                ),
                onPressed: () {
                  // Handle edit button press
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color(0xFFB0DB2D),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              description,
              style: ManropeTextStyleBold(16, Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Profile',
              style: FredokaTextStyle(24, businessStatusColor),
            ),
            SizedBox(height: 8.0),
            Text(
              'An overview of your business information in our itinerary package feature.',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Build_info(
              'Personal Details',
              'John Doe',
              '+63 918 8074175',
              'info@qubegallery.ph',
              // Adjust the box height as needed
            ),
            buildAbout(
              'Qube Gallery',
              'We are a member gallery of Artsy, the world’s largest and premiere online art marketplace. Since 2013, we have participated in international art fairs including Art Kaoshiung and Art Tainan in Taiwan, Tokyo International Art Fair in Japan, Art Apart in Singapore, and Art Central in Hongkong',
              250, // Adjust the box height as needed
            ),
            buildLocation(
              'Location',
              'Unit I-b, Crossroads Mall Gov. M. Cuenco Ave. Banilad Cebu City Philippines 6000.',
              150, // Adjust the box height as needed
            ),
            buildCategory(
              'Business Category',
              'ART MUSEUM',
              150, // Adjust the box height as needed
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ),
              SizedBox(width: 8.0),
              Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: [
                _buildMenuContainer(Icons.description, 'Terms and Policy', () {
                  // Handle Terms and Policy tap
                }),
                _buildMenuContainer(Icons.help, 'Help Center', () {
                  // Handle Help Center tap
                }),
                _buildMenuContainer(Icons.subscriptions, 'Subscription', () {
                  // Handle Subscription tap
                }),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle log out button press
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuContainer(IconData icon, String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE1FF86),
          ),
          child: Icon(
            icon,
            color: Color(0xFFB0DB2D),
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

Widget buildRatingBar(String label, double widthFactor, String percentage,
    Color color, Color white) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontFamily: 'Fredoka',
          fontSize: 16,
          color: color,
        ),
      ),
      SizedBox(width: 8.0),
      Container(
        width: 220,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: widthFactor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFABCDEF),
            ),
          ),
        ),
      ),
      SizedBox(width: 8.0),
      Text(
        percentage,
        style: TextStyle(
          fontFamily: 'Fredoka',
          fontSize: 16,
          color: color,
        ),
      ),
    ],
  );
}

TextStyle fredokaTextStyle(double fontSize, Color color) {
  return TextStyle(
    fontFamily: 'Fredoka',
    fontSize: fontSize,
    color: color,
  );
}
