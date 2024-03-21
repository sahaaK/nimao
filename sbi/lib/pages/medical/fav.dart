// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sbi/components/doctors.dart';
import 'package:sbi/components/doctile.dart';
import 'package:sbi/pages/medical/doc.dart';

class FavouriteDoctors extends StatefulWidget {
  final List<Doctors> doctorsList;

  const FavouriteDoctors({Key? key, required this.doctorsList})
      : super(key: key);

  @override
  State<FavouriteDoctors> createState() => _FavouriteDoctorsState();
}

class _FavouriteDoctorsState extends State<FavouriteDoctors> {
  // Method to navigate to the DoctorDetail screen
  void navigateToDoctor(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetail(
          doctors:
              widget.doctorsList[index], // Use the correct doctor's details
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Color(0xff4C4DDC);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Favorite Doctors'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
          crossAxisSpacing: 2.0, // Set the spacing between columns
          mainAxisSpacing: 6.0, // Set the spacing between rows
          childAspectRatio: 0.75,
        ),
        itemCount: widget.doctorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                navigateToDoctor(index), // Navigate to DoctorDetail on tap
            child: DocTile(
              doctors: widget.doctorsList[index],
              onTap: () => navigateToDoctor(index),
            ),
          );
        },
      ),
    );
  }
}
