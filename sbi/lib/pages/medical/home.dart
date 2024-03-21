// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sbi/components/doctors.dart';
import 'package:sbi/pages/medical/calendar.dart';

import '../../components/doctile.dart';
import 'doc.dart';
import 'fav.dart';

class HomePage extends StatefulWidget {
  final String selectedLanguage;

  const HomePage({
    Key? key,
    required this.selectedLanguage,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToFavouriteDoctors() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavouriteDoctors(doctorsList: doctorsMenu),
      ),
    );
  }

  List<Doctors> doctorsMenu = [
    Doctors(
        name: 'Dr. Phill',
        description: 'neuro scientist',
        ratings: '4.1',
        imagePath: 'assets/doc-1.png'),
    Doctors(
        name: 'Dr. Anchid',
        description: 'Nurse',
        ratings: '4.1',
        imagePath: 'assets/doc-2.png'),
    Doctors(
        name: 'Dr. Aaran',
        description: 'Dental clinic',
        ratings: '4.1',
        imagePath: 'assets/doc-1.png'),
    Doctors(
        name: 'Dr. Kavin',
        description: 'Lab scientist',
        ratings: '4.1',
        imagePath: 'assets/doc-2.png'),
    Doctors(
        name: 'Dr. Aaran',
        description: 'Dental clinic',
        ratings: '4.1',
        imagePath: 'assets/doc-1.png'),
    Doctors(
        name: 'Dr. Kavin',
        description: 'Lab scientist',
        ratings: '4.1',
        imagePath: 'assets/doc-2.png'),
  ];

  final List<String> illnesses = [
    'Headache',
    'Fever',
    'Back Pain',
    'Common Cold',
    'Allergies',
    'Stomachache',
  ];

  // Navigate to doctor detail page
  void navigateToDoctor(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => DoctorDetail(
              doctors: doctorsMenu[index],
            )),
      ),
    );
  }

  // Method to handle bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        // Navigate to Home screen
        // You can replace HomeScreen with your actual home screen widget
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(selectedLanguage: widget.selectedLanguage),
          ),
        );
      } else if (index == 1) {
        // Navigate to Calendar screen when Calendar button is selected
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Calendar(
              doctor: null,
            ),
          ),
        );
      } else if (index == 2) {
        // Navigate to FavouriteDoctors screen when Favorites button is selected
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavouriteDoctors(doctorsList: doctorsMenu),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Color(0xff4C4DDC);
    int _selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.white,
        activeColor: Colors.blue, // Change this to your primaryColor
        padding: EdgeInsets.all(16),
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,

        tabs: [
          GButton(
            icon: Icons.home,
            text: widget.selectedLanguage == 'SO' ? 'Home' : 'Bilow',
          ),
          GButton(
            icon: CupertinoIcons.calendar,
            text: widget.selectedLanguage == 'SO' ? 'Calendar' : 'Taariikh',
          ),
          GButton(
            icon: Icons.favorite,
            text: widget.selectedLanguage == 'SO' ? 'Favorites' : 'xiisaysid',
          ),
        ],
      ),
      backgroundColor: Color(0xff4C4DDC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // hi there
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.selectedLanguage == 'SO'
                                ? 'So dhawow'
                                : 'Hi welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Gap(4),
                          Text(
                            'Leonardo DaVinci',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffCDCDF8),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset('assets/doc-1.png'),
                      )
                    ],
                  ),
                  Gap(20),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffCDCDF8),
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                      hintText: widget.selectedLanguage == 'SO'
                          ? 'search doctor'
                          : 'Raadi dokotar',
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xffCDCDF8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xffCDCDF8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(50),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Color(0xffF1F1FF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedLanguage == 'SO'
                              ? 'Your symptoms'
                              : 'Astaamaha',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.selectedLanguage == 'SO'
                              ? 'see all?'
                              : 'Eeg dhammaan?',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ],
                    ),
                    Gap(20),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: illnesses.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                illnesses[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedLanguage == 'SO'
                              ? 'Favourite Doctor'
                              : 'Dokotarada ugu jecel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: navigateToFavouriteDoctors,
                          child: Text(
                            widget.selectedLanguage == 'SO'
                                ? 'see all?'
                                : 'Eeg dhammaan?',
                            style: TextStyle(color: Colors.indigo),
                          ),
                        ),
                      ],
                    ),
                    Gap(5),
                    Expanded(
                      child: ListView.builder(
                        itemCount: doctorsMenu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => DocTile(
                              doctors: doctorsMenu[index],
                              onTap: () => navigateToDoctor(index),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 5,
                            left: 5,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.indigo.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/doc-3.png',
                                height: 70,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Dr. Phill'),
                                  Text(
                                    'Neuro Scientist',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      Text('4.7')
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.indigo,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
