import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicar/models/recommend_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // page controller
  final _pageController = PageController(viewportFraction: 0.877);

  String generateRandomNumber() {
    var random = new Random();
    return random.nextInt(100).toString();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 40,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        unselectedItemColor: Colors.deepOrangeAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Setting"),
        ],
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
      ),
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // custom app bar
          Container(
            margin: EdgeInsets.only(top: 20.8, left: 20.8, right: 20.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 57.6,
                    width: 57.6,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928)),
                    // child: SvgPicture.asset("assets/icons/menu.icons",color: Colors.black,),
                    child: Icon(Icons.menu, color: Colors.grey, size: 24.0)),
                Container(
                    height: 57.6,
                    width: 57.6,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928)),

                    // child: SvgPicture.asset("assets/icons/menu.icons",color: Colors.black,),
                    child: Icon(Icons.search, color: Colors.grey, size: 24.0))
              ],
            ),
          ),

          // Text Wegets for title
          Padding(
            padding: EdgeInsets.only(top: 48, left: 28.8),
            child: Text(
              "Explore\nthe nature",
              style: GoogleFonts.playfairDisplay(
                  fontSize: 45.6, fontWeight: FontWeight.w700),
            ),
          ),
          // custom tabbar with custom indicator
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 14.4, top: 28.8),
            child: DefaultTabController(
                length: 6,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    isScrollable: true,
                    labelColor: Color(0XFF000000),
                    unselectedLabelColor: Color(0XFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                        fontWeight: FontWeight.w700, fontSize: 14),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text("Recommended"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text("Populer"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text("New Distination"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text("Hidden Gems"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text("Recent Update"),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text("New Places"),
                        ),
                      ),
                    ])),
          ),

          // ListView widget with PageView
          // Recommendation Session
          Container(
            height: 218.8,
            margin: EdgeInsets.only(top: 16),
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  recommedations.length,
                  (int index) => Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            image: DecorationImage(
                                image:
                                    NetworkImage(recommedations[index].image),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 19.2,
                                left: 19.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 19.2, sigmaY: 19.2),
                                    child: Container(
                                      height: 36,
                                      padding: EdgeInsets.only(
                                          left: 16.72, right: 14.4),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on,
                                              color: Colors.white),
                                          SizedBox(width: 9.52),
                                          Text(
                                            recommedations[index].name,
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.8),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
            ),
          ),

          // Dot Indicator
          // using SmoothPageIndicator
          Padding(
              padding: EdgeInsets.only(left: 28, top: 28),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: recommedations.length,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0XFF8a8a8a),
                    dotColor: Color(0XFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8),
              )),

          // text widget for populer Categories
          Padding(
              padding: EdgeInsets.only(left: 28.8, right: 28.8, top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Popular Categoris',
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF000000)),
                  ),
                  Text(
                    'Show All',
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF8a8a8a)),
                  )
                ],
              )),

          Container(
            margin: EdgeInsets.only(top: 33.6),
            height: 45.5,
            child: ListView.builder(
              itemCount: populars.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(left: 15, right: 9.6),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].backgoundColor)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            populars[index].title,
                            style:
                                TextStyle(color: Color(populars[index].color)),
                          ),
                        )
                      ],
                    ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 33.6),
            height: 124.8,
            child: ListView.builder(
              itemCount: beaches.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10.8, right: 12),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, branchIndex) {
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 9.6),
                  height: 124.8,
                  width: 188.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(beaches[branchIndex].image +
                              generateRandomNumber()))),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
