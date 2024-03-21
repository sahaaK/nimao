import 'package:flutter/material.dart';
import 'package:sbi/components/doctors.dart';
import 'package:sbi/pages/medical/appointment.dart'; // Import the Appointment widget

class Calendar extends StatelessWidget {
  final Doctors? doctor;

  Calendar({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.indigo,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 55,
                    left: 0,
                    child: Container(
                      width: 200,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor Name: ${doctor?.name}',
                              style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Description: ${doctor?.description}',
                              style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Ratings: ${doctor?.ratings}',
                              style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        doctor!.imagePath,
                        width: 180,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Appointment Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: 229,
                height: 100,
                child:
                    Appointment()), // Use the Appointment widget to display date and time
          ],
        ),
      ),
    );
  }
}
