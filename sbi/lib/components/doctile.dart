// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sbi/components/doctors.dart';

class DocTile extends StatelessWidget {
  final Doctors doctors;
  final void Function()? onTap;
  const DocTile({super.key, required this.doctors, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            //
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              left: 30,
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // image path
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  doctors.imagePath,
                  height: 150,
                ),
                // name plus ratings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(doctors.name),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.purple,
                          size: 16,
                        ),
                        Text(doctors.ratings)
                      ],
                    )
                  ],
                ),

                // descriptions
                Text(doctors.description)
              ],
            )
          ],
        ),
      ),
    );
  }
}
